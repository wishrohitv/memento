import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'isar_schemas.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(isarSchemas, directory: dir.path);

    return _isar!;
  }
}
