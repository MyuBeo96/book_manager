import 'dart:async';

class TextBloc {
  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  dispose() {
    _textController.close();
  }

  updateText({
    required String text,
    String textError = 'Invalid value entered!',
  }) {
    // ignore: unnecessary_null_comparison
    (text == null || text == "")
        ? _textController.sink.addError(textError)
        : _textController.sink.add(text);
  }
}
