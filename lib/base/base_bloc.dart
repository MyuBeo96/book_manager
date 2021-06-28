import 'dart:async';

import 'package:book_manager/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _streamController = StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _streamController.sink;

  BaseBloc() {
    _streamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('Invalid event');
      }

      dispathEvent(event);
    });
  }

  void dispathEvent(BaseEvent event);

  void dispose() {
    _streamController.close();
  }
}
