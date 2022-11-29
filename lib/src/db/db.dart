// ignore_for_file: avoid_print

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sprefs;
late Box<dynamic> hive;
Directory? dbDir;
