import 'dart:async';

import 'package:core/src/events/app_event.dart';

class AppEventImpl implements AppEventNotifier, AppEventObserver {
  final StreamController<AppEvent> _controller = StreamController<AppEvent>.broadcast();

  @override
  StreamSubscription<T> observe<T extends AppEvent>(
      void Function(T event) handler, {
        bool observeEventsOfExactType = false,
      }) {
    return _controller.stream
        .where(
          (AppEvent event) => event.runtimeType == T || (!observeEventsOfExactType && event is T),
    )
        .cast<T>()
        .listen(handler);
  }

  @override
  void notify(AppEvent event) => _controller.add(event);

  Future<void> dispose() async {
    await _controller.close();
  }
}
