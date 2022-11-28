import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/path.provider.dart';

class DBSelectorTile extends ConsumerWidget {
  const DBSelectorTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: min(size.width, 400),
      child: ListTile(
        leading: const Icon(Icons.storage),
        title: const Text('Database directory'),
        subtitle: const PathView(),
        onTap: () async => await ref.read(dbPathProvider.notifier).select(),
      ),
    );
  }
}

class PathView extends ConsumerWidget {
  const PathView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(dbPathProvider).value;
    if (path == null) return const Text('No path selected');
    return Text(path.path);
  }
}
