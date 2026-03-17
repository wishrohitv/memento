import 'package:memento/features/home/model/domain/revision.dart';

class Group {
  final String groupName;
  final List<Revision> revisions;

  Group({required this.groupName, required this.revisions});
}
