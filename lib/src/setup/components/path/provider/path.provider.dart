import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../main.dart';
import '../../../../db/db.dart';
import '../../../../db/hive.dart';
import '../../../provider/setup.provider.dart';
import 'permission.provider.dart';

final dbPathProvider =
    AsyncNotifierProvider<DBPathProvider, Directory?>(DBPathProvider.new);

class DBPathProvider extends AsyncNotifier<Directory?> {
  @override
  FutureOr<Directory?> build() async {
    final currentDir = Directory.current;
    final permitted = await ref.read(permissionProvider(currentDir).future);
    if (permitted) return Directory(join(currentDir.path, '.$appName'));

    final supportDir = await getApplicationSupportDirectory();
    final permitted2 = await ref.read(permissionProvider(supportDir).future);
    if (permitted2) return Directory(join(supportDir.path, '.$appName'));

    final docDir = await getApplicationDocumentsDirectory();
    final permitted3 = await ref.read(permissionProvider(docDir).future);
    if (permitted3) return Directory(join(docDir.path, '.$appName'));

    return null;
  }

  Future<void> select() async {
    final selected = await FilePicker.platform.getDirectoryPath();
    if (selected == null) return;
    final dir = Directory(join(selected, '.$appName'));
    state = AsyncValue.data(dir);
  }

  Future<void> next() async {
    if (state.value == null) return;
    await sprefs.setString('dbDir', state.value!.path);
    dbDir = state.value!;
    final success = await initHive();
    if (!success) return;
    ref.read(pageControllerProvider).animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }
}
