import 'package:chate_ease/components/message_bubble.dart';
import 'package:chate_ease/core/models/chat_message.dart';
import 'package:chate_ease/core/services/auth/auth_service.dart';
import 'package:chate_ease/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final userCurrent = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messageStream(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Sem dados. Vamos conversar?"));
          } else {
            final msg = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemCount: msg.length,
              itemBuilder: (ctx, i) {
                return MessageBubble(
                  key: ValueKey(msg[i].id),
                  message: msg[i],
                  belongsToCurretuser: userCurrent?.id == msg[i].id,
                );
              },
            );
          }
        });
  }
}
