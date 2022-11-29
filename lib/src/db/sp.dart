// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

import 'db.dart';

Future<void> initSharedPrefs() async {
  final st = DateTime.now().millisecondsSinceEpoch;
  sprefs = await SharedPreferences.getInstance();
  final mt = DateTime.now().millisecondsSinceEpoch;
  await sprefs.setBool('init', true);
  final et = DateTime.now().millisecondsSinceEpoch;
  print('SP init in ${mt - st} ms');
  print('SP put in ${et - mt} ms');
}
