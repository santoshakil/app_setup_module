// ignore_for_file: avoid_print

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'db.dart';

Future<void> initHive() async {
  final st = DateTime.now().millisecondsSinceEpoch;
  final path = await getApplicationSupportDirectory();
  await Hive.initFlutter(join(path.path, '.app_setup_module_hive'));
  hive = await Hive.openBox('hive');
  final mt = DateTime.now().millisecondsSinceEpoch;
  await hive.put('init', true);
  final et = DateTime.now().millisecondsSinceEpoch;
  print('Hive init in ${mt - st} ms');
  print('Hive put in ${et - mt} ms');
}
