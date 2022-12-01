import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/path.provider.dart';
import '../provider/permission.provider.dart';

class NoPermissionWidget extends ConsumerWidget {
  const NoPermissionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    if (path == null) return const SizedBox.shrink();
    final permitted = ref.watch(permissionProvider(path)).value;
    debugPrint('>>> permitted: $permitted');
    if (permitted == null) return const SizedBox.shrink();
    if (permitted) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber,
                color: theme.errorColor,
                size: 16.0,
              ),
              const SizedBox(width: 3.0),
              Text(
                'No permission to access this directory',
                style:
                    theme.textTheme.caption?.copyWith(color: theme.errorColor),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.back_hand_outlined,
              color: theme.errorColor,
              size: 50.0,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            'Solution: ',
            style: theme.textTheme.caption?.copyWith(fontSize: 16.0),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Icon(Icons.donut_large_rounded, size: 16.0),
              const SizedBox(width: 10.0),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'You may have disabled unauthorized changes on the folder to be protected from Ransomeware. To allow it, go to ',
                        style: theme.textTheme.caption,
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.arrow_right_alt, size: 16),
                      ),
                      TextSpan(
                        text: ' Windows Security',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Virus & threat protection',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Manage settings',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Controlled folder access',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Turn off Controlled folder access.',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Icon(Icons.donut_large_rounded, size: 16.0),
              const SizedBox(width: 10.0),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'You may have also allow ',
                        style: theme.textTheme.caption,
                      ),
                      TextSpan(
                        text: 'ag_accounting.exe',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' file to access the folder. To allow it, go to ',
                        style: theme.textTheme.caption,
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.arrow_right_alt, size: 16),
                      ),
                      TextSpan(
                        text: ' Windows Security',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Virus & threat protection',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Manage settings',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Controlled folder access',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const WidgetSpan(
                        child: Icon(Icons.double_arrow, size: 16),
                      ),
                      TextSpan(
                        text: 'Allow an app through Controlled folder access.',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Icon(Icons.donut_large_rounded, size: 16.0),
              const SizedBox(width: 10.0),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'You may also see a winodws security popup to allow access to the folder.',
                        style: theme.textTheme.caption,
                      ),
                      TextSpan(
                        text: 'To allow it, click on',
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Note:',
                    style: theme.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text:
                        ' After changing the settings, please restart the app. ',
                    style: theme.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  // TextSpan(
                  //   text: 'Click here to restart.',
                  //   style: theme.textTheme.caption!.copyWith(
                  //       fontWeight: FontWeight.bold, color: primaryLight),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () => RestartWidget.restartApp(context),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
