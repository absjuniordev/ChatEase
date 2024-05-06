import 'package:chate_ease/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurretuser;
  const MessageBubble({
    super.key,
    required this.message,
    required this.belongsToCurretuser,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment:
          belongsToCurretuser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurretuser
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          width: size / 2.3,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Text(
                message.username,
                style: TextStyle(
                  color: belongsToCurretuser ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message.text,
                style: TextStyle(
                  color: belongsToCurretuser ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
