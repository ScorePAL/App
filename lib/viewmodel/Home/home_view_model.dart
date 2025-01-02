import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';

import '../../model/User/user.dart';

class HomeViewModel extends ChangeNotifier {
  late IOWebSocketChannel _channel;
  final Map<String, MessageHandler> _handlers = {}; // Pour le pattern stratégie
  final _messageStreamController = StreamController<String>();

  final User _user;

  Stream<String> get messages => _messageStreamController.stream;

  HomeViewModel(this._user) {
    _initializeWebSocket();
  }

  void _initializeWebSocket() {
    _channel = IOWebSocketChannel.connect('ws://localhost:8080/ws?clubId=${_user.relatedTo.id}');

    _channel.stream.listen(
          (message) {
        _handleMessage(message);
      },
      onError: (error) {
        print("WebSocket error: $error");
        _messageStreamController.addError(error);
      },
      onDone: () {
        print("WebSocket closed.");
      },
    );
  }

  void _handleMessage(String message) {
    final type = _extractMessageType(message); // Suppose que le type est encodé dans le message
    if (_handlers.containsKey(type)) {
      _handlers[type]?.handle(message);
    } else {
      print("No handler for message type: $type");
    }
  }

  String _extractMessageType(String message) {
    // Exemple de logique d'extraction de type (JSON, protocoles personnalisés, etc.)
    return message.split(":").first; // Adapté à votre protocole
  }

  void registerHandler(String type, MessageHandler handler) {
    _handlers[type] = handler;
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  @override
  void dispose() {
    _channel.sink.close();
    _messageStreamController.close();
    super.dispose();
  }
}

abstract class MessageHandler {
  void handle(String message);
}
