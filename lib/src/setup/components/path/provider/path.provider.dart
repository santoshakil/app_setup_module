import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final dbPathProvider =
    AsyncNotifierProvider<DBPathProvider, Directory>(DBPathProvider.new);

class DBPathProvider extends AsyncNotifier<Directory> {
  @override
  FutureOr<Directory> build() => getApplicationDocumentsDirectory();

  Future<void> select() async {
    final selected = await FilePicker.platform.getDirectoryPath();
    if (selected != null) state = AsyncValue.data(Directory(selected));
  }

  Future<void> create() async {
    final file = Directory(join(state.value!.path, 'temp'));
    if (!(await file.exists())) await file.create();
  }
}
