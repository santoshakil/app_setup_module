import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/path/view/path.view.dart';
import '../components/welcome/view/welcome.view.dart';
import '../provider/setup.provider.dart';

class SetupView extends ConsumerWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: PageView(
        controller: ref.watch(pageControllerProvider),
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PathView(),
          WelcomeView(),
        ],
      ),
    );
  }
}
