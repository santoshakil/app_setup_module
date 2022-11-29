import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/db/hive.dart';
import 'src/db/sp.dart';

const appName = 'app_setup_module';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPrefs();
  await initHive();
  runApp(const MyApp());
}
