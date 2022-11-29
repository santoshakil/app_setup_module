import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'db/db.dart';
import 'home/view/home.dart';
import 'setup/view/setup.view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: dbDir != null ? const HomeView() : const SetupView(),
      ),
    );
  }
}
