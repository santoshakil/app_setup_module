import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/db/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDB();
  runApp(const MyApp());
}
