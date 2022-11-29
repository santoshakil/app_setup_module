import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';

import '../../main.dart';
import 'db.dart';

Future<bool> initHive() async {
  if (dbDir == null) return false;
  try {
    await Hive.initFlutter(join(dbDir!.path, '.${appName}_data'));
    hive = await Hive.openBox('hive');
    await hive.put('init', true);
    return true;
  } catch (_) {
    return false;
  }
}
