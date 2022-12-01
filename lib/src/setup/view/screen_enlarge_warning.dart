import 'package:flutter/material.dart';

class ScreenEnlargeWarning extends StatelessWidget {
  const ScreenEnlargeWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Please enlarge your application window.',
          textScaleFactor: 1.5,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}
