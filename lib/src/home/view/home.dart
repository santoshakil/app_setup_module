import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../app.dart';
import '../../db/db.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home'),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Clear'),
            onPressed: () async {
              final navigator = Navigator.of(context);
              await Hive.deleteFromDisk();
              await sprefs.clear();
              dbDir = null;
              await navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const MyApp()),
                (_) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
