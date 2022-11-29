// ignore_for_file: avoid_print

import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'db.dart';

Future<void> initSharedPrefs() async {
  sprefs = await SharedPreferences.getInstance();
  final dbDirPath = sprefs.getString('dbDir');
  if (dbDirPath != null) dbDir = Directory(dbDirPath);
  print('DB Dir $dbDir');
}
