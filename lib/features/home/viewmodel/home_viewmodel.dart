import 'package:flutter/material.dart';
import 'package:memento/core/utils/error_result.dart';
import 'package:memento/core/utils/result.dart';
import 'package:memento/features/home/model/domain/group.dart';
import 'package:memento/features/home/model/domain/revision.dart';
import 'package:memento/features/home/model/domain/revision_rating_type.dart';
import 'package:memento/features/home/repositories/home_local_repository.dart';

class HomeViewmodel extends ChangeNotifier {
  final HomeLocalRepository _homeLocalRepository = HomeLocalRepository();
  bool isLoading = false;

  HomeViewmodel() {
    fetchNotes();
  }
  List<Revision> _revisions = [];
  List _homeNoteFeed = [];
  List get homeNoteFeed => _homeNoteFeed;

  List<Revision> get revisions => _revisions;

  Future<Result<void, ErrorResult>> addNote({
    required String title,
    String? group,
    String? description,
  }) async {
    final result = await _homeLocalRepository.addNote(
      title,
      description,
      group,
    );

    return result.fold(
      onSuccess: (newRevision) {
        _revisions.insert(0, newRevision);
        _buildHomeFeed();
        notifyListeners();
        return Result.success(null);
      },
      onFailure: (error) {
        return Result.failure(error);
      },
    );
  }

  Future<Result<void, ErrorResult>> fetchNotes() async {
    isLoading = true;
    notifyListeners();
    final result = await _homeLocalRepository.fetchNotes();
    return result.fold(
      onSuccess: (revisions) {
        _revisions = revisions;
        isLoading = false;
        _buildHomeFeed();
        notifyListeners();
        return Result.success(null);
      },
      onFailure: (error) {
        isLoading = false;
        notifyListeners();
        return Result.failure(error);
      },
    );
  }

  Future<Result<void, ErrorResult>> updateNote(
    int id, {
    String? title,
    String? description,
    RevisionRatingType? rating,
  }) async {
    final result = await _homeLocalRepository.updateNote(
      id,
      newTitle: title,
      newDescription: description,
      rating: rating,
    );

    final index = _revisions.indexWhere((r) => r.id == id);
    return result.fold(
      onSuccess: (updatedRevision) {
        if (index != -1) {
          _revisions[index] = updatedRevision;
        }
        _buildHomeFeed();
        notifyListeners();
        return Result.success(null);
      },
      onFailure: (error) {
        return Result.failure(error);
      },
    );
  }

  Future<Result<void, ErrorResult>> delete(int id) async {
    final result = await _homeLocalRepository.deleteNote(id);
    return result.fold(
      onSuccess: (data) {
        _revisions.removeWhere((r) => r.id == id);
        _buildHomeFeed();
        notifyListeners();
        return Result.success(null);
      },
      onFailure: (error) {
        return Result.failure(error);
      },
    );
  }

  void _buildHomeFeed() {
    // Clear previous feed
    _homeNoteFeed.clear();

    Map<String, List<Revision>> groups = {};

    /// Group only those notes that is more than 2 based on group value
    Map<String, Revision> storeFirstNote = {};
    for (Revision revision in revisions) {
      String? groupName = revision.group;
      if (groupName == null) continue;
      if (groupName.isEmpty) continue;
      final existingGroupItems = groups[groupName];
      if (existingGroupItems != null) {
        existingGroupItems.add(revision);
      } else {
        // Create entry for group
        final initialNote = storeFirstNote[groupName];
        if (initialNote != null) {
          groups[groupName] = [initialNote, revision];
        } else {
          // Store initial note
          storeFirstNote[groupName] = revision;
        }
      }
    }
    // Clean the storeFirstNote
    storeFirstNote.clear();

    // Build home feed
    for (Revision revision in revisions) {
      _homeNoteFeed.add(revision);
      if (revision.group == null) continue;
      List<Revision>? groupedItem = groups[revision.group];
      if (groupedItem != null) {
        _homeNoteFeed.add(
          Group(groupName: revision.group!, revisions: groupedItem),
        );
        // remove the key value so that it could appear only once
        groups.remove(revision.group);
      }
    }

    // Clean the group
    groups.clear();
  }
}
