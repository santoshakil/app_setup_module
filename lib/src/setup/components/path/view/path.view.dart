import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/path.provider.dart';
import 'db.selector.dart';

class PathView extends ConsumerWidget {
  const PathView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DBSelectorTile(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton(
                child: const Text('Next'),
                onPressed: () async =>
                    await ref.read(dbPathProvider.notifier).create(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
