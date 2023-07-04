import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed;
});



/*
    resumed   app pasó del background al foreground
    inactive  app ya no está focused (en primer plano)
    paused    app se mandó al background
    detached  app fue destruída
    */

