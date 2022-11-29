import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

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
    final status = await Permission.manageExternalStorage.status;
    debugPrint('$status');
    final dir = Directory(join(arg!.path, 'test'));
    await dir.create();
  }
}
