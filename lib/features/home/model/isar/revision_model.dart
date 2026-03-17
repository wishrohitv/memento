import 'package:isar_community/isar.dart';
import 'package:memento/features/home/model/domain/revision_rating_type.dart';

part 'revision_model.g.dart';

@Collection()
class RevisionModel {
  Id id = Isar.autoIncrement;

  late String title;

  String? description;

  String? group;

  @Enumerated(EnumType.ordinal32)
  RevisionRatingType? rating;

  DateTime? revisionDate;

  late DateTime dateCreation;

  late DateTime dateModification;
}
