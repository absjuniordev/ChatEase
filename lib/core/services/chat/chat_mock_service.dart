import 'dart:async';
import 'dart:math';
import 'package:chate_ease/core/models/chat_message.dart';
import 'package:chate_ease/core/models/chat_user.dart';
import 'package:chate_ease/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msg = [
    // ChatMessage(
    //   id: "1",
    //   text: "Bom dia! Teremos reunião hoje?",
    //   createdAt: DateTime.now(),
    //   uerId: "123",
    //   username: "Fau",
    //   userImageUrl: "assets/image/avatar.png",
    // ),
    // ChatMessage(
    //   id: "2",
    //   text: "SIm. Pode ser agora!",
    //   createdAt: DateTime.now(),
    //   uerId: "456",
    //   username: "Yslla",
    //   userImageUrl: "assets/image/avatar.png",
    // ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msg);
  });
  @override
  Stream<List<ChatMessage>> messageStream() {
    return _msgStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      uerId: user.id,
      username: user.name,
      userImageUrl: user.imageUrl,
    );
    _msg.add(newMessage);
    _controller?.add(_msg.reversed.toList());
    return newMessage;
  }
}
