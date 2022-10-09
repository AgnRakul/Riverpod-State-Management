import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final helloWorldProvider = Provider<String>((ref) {
  return 'Hello World';
});

final counterStateProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

class Clock extends StateNotifier<DateTime> {
  late final Timer _timer;

  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        // 3. update the state with the current time
        state = DateTime.now();
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>(
  (ref) {
    return Clock();
  },
);
