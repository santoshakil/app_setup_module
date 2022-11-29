import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

typedef _Notifier
    = AsyncNotifierProviderFamily<PermissionProvider, bool, Directory?>;

final permissionProvider = _Notifier(PermissionProvider.new);

class PermissionProvider extends FamilyAsyncNotifier<bool, Directory?> {
  @override
  FutureOr<bool> build(Directory? arg) async {
    if (arg == null) return false;

    try {
      await arg.createTemp();
      return true;
    } on Exception catch (e) {
      debugPrint('$e');
      return false;
    }
  }

  Future<void> getPermission() async {
    final dir = Directory(join(arg!.path, 'test'));
    final exist = await dir.exists();
    if (!exist) await dir.create();
    final name = DateTime.now().toIso8601String();
    final file = File(join(dir.path, '$name.txt'));
    await file.create();
    await file.writeAsString(name);
  }
}
