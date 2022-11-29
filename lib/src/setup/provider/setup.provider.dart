import 'package:flutter/material.dart' show PageController;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider = Provider.autoDispose((ref) {
  ref.keepAlive();
  return PageController();
});
