import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/path.provider.dart';
import '../provider/permission.provider.dart';
import 'db.selector.dart';

class PathView extends StatelessWidget {
  const PathView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: min(size.width, 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DBSelectorTile(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [_Reset(), _Next()],
            ),
          ],
        ),
      ),
    );
  }
}

class _Next extends ConsumerWidget {
  const _Next();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    if (path == null) return const SizedBox.shrink();
    final permitted = ref.watch(permissionProvider(path)).value ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ElevatedButton(
        onPressed: permitted
            ? () async => await ref.read(dbPathProvider.notifier).next()
            : null,
        child: const Text('Next'),
      ),
    );
  }
}

class _Reset extends ConsumerWidget {
  const _Reset();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => ref.invalidate(dbPathProvider),
      child: const Text('Reset'),
    );
  }
}
