import 'package:isar_community/isar.dart';
import 'package:memento/core/database/isar_service.dart';
import 'package:memento/core/utils/error_result.dart';
import 'package:memento/core/utils/result.dart';
import 'package:memento/features/home/model/domain/revision.dart';
import 'package:memento/features/home/model/isar/revision_model.dart';
import 'package:memento/features/home/model/domain/revision_rating_type.dart';
import 'package:memento/features/home/model/mapper/revision_mapper.dart';

class HomeLocalRepository {
  // CREATE - a note and save to db
  Future<Result<Revision, ErrorResult>> addNote(
    String title,
    String? description,
    String? group,
  ) async {
    try {
      final isar = await IsarService.instance;
      // create a new note object
      final newNote = RevisionModel();
      newNote.title = title;
      if (group != null) {
        newNote.group = group;
      }
      if (description != null) {
        newNote.description = description;
      }
      newNote.dateCreation = DateTime.now();
      newNote.dateModification = DateTime.now();
      // save to db
      await isar.writeTxn(() => isar.revisionModels.put(newNote));

      return Result.success(newNote.toDomain());
    } catch (e) {
      return Result.failure(ErrorResult(e.toString()));
    }
  }

  // READ - notes from db
  Future<Result<List<Revision>, ErrorResult>> fetchNotes() async {
    try {
      final isar = await IsarService.instance;
      List<RevisionModel> fetchedNotes = await isar.revisionModels
          .where()
          .sortByDateModificationDesc()
          .findAll();
      return Result.success(fetchedNotes.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Result.failure(ErrorResult(e.toString()));
    }
  }

  // UPDATE - a note in db
  Future<Result<Revision, ErrorResult>> updateNote(
    int id, {
    String? newTitle,
    String? newDescription,
    RevisionRatingType? rating,
  }) async {
    try {
      final isar = await IsarService.instance;
      final existingNote = await isar.revisionModels.get(id);
      if (existingNote != null) {
        if (newTitle != null) {
          existingNote.title = newTitle;
        }
        if (newDescription != null) {
          existingNote.description = newDescription;
        }
        if (rating != null) {
          existingNote.rating = rating;
        }
        existingNote.dateModification = DateTime.now();
        await isar.writeTxn(() => isar.revisionModels.put(existingNote));
      }
      return Result.success(existingNote!.toDomain());
    } catch (e) {
      return Result.failure(ErrorResult(e.toString()));
    }
  }

  // DELETE - a note from the db
  Future<Result<void, ErrorResult>> deleteNote(int id) async {
    try {
      final isar = await IsarService.instance;
      await isar.writeTxn(() => isar.revisionModels.delete(id));
      return Result.success(null);
    } catch (e) {
      return Result.failure(ErrorResult(e.toString()));
    }
  }
}
