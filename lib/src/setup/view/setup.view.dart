import 'package:app_setup_module/src/setup/view/screen_enlarge_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/path/view/path.view.dart';
import '../components/welcome/view/welcome.view.dart';
import '../provider/setup.provider.dart';

bool isExceedSize(Size size, [Size minimumSize = const Size(1170, 550)]) =>
    size.height < minimumSize.height || size.width < minimumSize.width;

class SetupView extends ConsumerWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return isExceedSize(size)
        ? const ScreenEnlargeWarning()
        : Material(
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
