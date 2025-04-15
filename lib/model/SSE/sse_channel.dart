import 'dart:async';

import 'package:universal_html/html.dart' as html;

class SseChannel {
  final html.EventSource eventSource;
  final StreamController<String> streamController;

  SseChannel._internal(this.eventSource, this.streamController);

  factory SseChannel.connect({
    required Uri uri,
    bool withCredentials = false,
    bool closeOnError = true,
  }) {
    final streamController = StreamController<String>();
    final eventSource =
        html.EventSource(uri.toString(), withCredentials: withCredentials);

    eventSource.addEventListener('message', (html.Event message) {
      streamController.add((message as html.MessageEvent).data as String);
    });

    // close if the endpoint is not working
    if (closeOnError) {
      eventSource.onError.listen((event) {
        eventSource.close();
        streamController.close();
      });
    }
    return SseChannel._internal(eventSource, streamController);
  }

  Stream get stream => streamController.stream;

  bool isClosed() => streamController.isClosed;

  void close() {
    eventSource.close();
    streamController.close();
  }
}
