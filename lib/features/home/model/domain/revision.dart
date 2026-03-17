import 'package:memento/features/home/model/domain/revision_rating_type.dart';

class Revision {
  final int id;
  final String title;
  final String? description;
  final String? group;
  final RevisionRatingType? rating;
  final DateTime? revisionDate;
  final DateTime dateCreation;
  final DateTime dateModification;

  Revision({
    required this.id,
    required this.title,
    this.description,
    this.group,
    this.revisionDate,
    required this.dateCreation,
    required this.dateModification,
    this.rating,
  });
}
