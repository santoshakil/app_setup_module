import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/path.provider.dart';
import '../provider/permission.provider.dart';

class DBSelectorTile extends ConsumerWidget {
  const DBSelectorTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: min(size.width, 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.storage),
            title: const Text('Database directory'),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [PathViewSubTitle(), NoPermissionText()],
            ),
            onTap: () async => await ref.read(dbPathProvider.notifier).select(),
          ),
        ],
      ),
    );
  }
}

class PathViewSubTitle extends ConsumerWidget {
  const PathViewSubTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    if (path == null) return const Text('No path selected');
    return Text(path.path);
  }
}

class NoPermissionText extends ConsumerWidget {
  const NoPermissionText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    if (path == null) return const SizedBox.shrink();
    final permitted = ref.watch(permissionProvider(path)).value;
    if (permitted == null) return const SizedBox.shrink();
    if (permitted) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        'No permission to access this directory',
        style: theme.textTheme.caption?.copyWith(color: theme.errorColor),
      ),
    );
  }
}
