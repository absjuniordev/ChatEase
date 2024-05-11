import 'dart:async';
import 'package:chate_ease/core/models/chat_message.dart';
import 'package:chate_ease/core/models/chat_user.dart';
import 'package:chate_ease/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messageStream() {
    return const Stream<List<ChatMessage>>.empty();
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    // ChatMessage => Mpa<String, dynamic>
    final docRef = await store.collection("chat").add({
      'text': text,
      'createdAt': DateTime.now().toIso8601String(),
      'uerId': user.id,
      'username': user.name,
      'userImageUrl': user.imageUrl,
    });
    final doc = await docRef.get();

    //  Mpa<String, dynamic> =>ChatMessage
    final data = doc.data()!;

    return ChatMessage(
      id: doc.id,
      text: data['text'],
      createdAt: DateTime.parse(data['createdAt']),
      uerId: data['uerId'],
      username: data['username'],
      userImageUrl: data['userImageUrl'],
    );
  }
}
