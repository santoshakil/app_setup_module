// ignore_for_file: avoid_print

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hive.dart';
import 'sp.dart';

late SharedPreferences sprefs;
late Box<dynamic> hive;

Future<void> initDB() async {
  await initSharedPrefs();
  await initHive();
  print('DB init done');
  print('Hive Path ${hive.path}');
  print('SP Path ${await getApplicationSupportDirectory()}');
}
