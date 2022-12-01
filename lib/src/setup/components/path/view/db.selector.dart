import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/path.provider.dart';
import 'no_permission_widget.dart';

class DBSelectorTile extends ConsumerWidget {
  const DBSelectorTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Select a folder to store the database',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextButton(
              onPressed: () async =>
                  await ref.read(dbPathProvider.notifier).select(),
              child: const Text('Browse'),
            )
          ],
        ),
        const SizedBox(height: 10),
        const PathViewSubTitle(),
        const NoPermissionWidget(),
      ],
    );
  }
}

class PathViewSubTitle extends ConsumerWidget {
  const PathViewSubTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    final theme = Theme.of(context);
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Selected path ',
            style:
                theme.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
          ),
          const WidgetSpan(
            child: Icon(Icons.double_arrow, size: 16),
          ),
          TextSpan(
            text: path?.path ?? 'Not selected',
            style: theme.textTheme.caption,
          ),
        ],
      ),
    );
  }
}
