import 'package:flutter/material.dart';

import '../components/path/view/path.view.dart';
import '../components/welcome/view/welcome.view.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        children: const [
          PathView(),
          WelcomeView(),
        ],
      ),
    );
  }
}
