import '../domain/revision.dart';
import '../isar/revision_model.dart';

extension RevisionModelMapper on RevisionModel {
  Revision toDomain() {
    return Revision(
      title: title,
      description: description,
      group: group,
      rating: rating,
      revisionDate: revisionDate,
      id: id,
      dateCreation: dateCreation,
      dateModification: dateModification,
    );
  }
}

extension RevisionDomainMapper on Revision {
  RevisionModel toIsar() {
    return RevisionModel()
      ..title = title
      ..description = description
      ..group = group
      ..rating = rating
      ..revisionDate = revisionDate
      ..dateCreation = DateTime.now()
      ..dateModification = DateTime.now();
  }
}
