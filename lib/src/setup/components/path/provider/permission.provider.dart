import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';

typedef _Notifier
    = AsyncNotifierProviderFamily<PermissionProvider, bool, Directory?>;

final permissionProvider = _Notifier(PermissionProvider.new);

class PermissionProvider extends FamilyAsyncNotifier<bool, Directory?> {
  @override
  FutureOr<bool> build(Directory? arg) async {
    if (arg == null) return false;

    try {
      final dir = Directory('.${appName}_temp');
      await dir.create(recursive: true);
      await dir.delete();
      return true;
    } on Exception catch (e) {
      debugPrint('$e');
      return false;
    }
  }

  Future<void> getPermission() async {}
}
