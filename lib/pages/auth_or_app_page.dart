import 'package:chate_ease/core/models/chat_user.dart';
import 'package:chate_ease/core/services/auth/auth_mock_service.dart';
import 'package:chate_ease/pages/auth_page.dart';
import 'package:chate_ease/pages/chat_page.dart';
import 'package:chate_ease/pages/loadind_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanger,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadindPage();
          } else {
            return snapshot.hasData ? const ChatPage() : const AuthPage();
          }
        },
      ),
    );
  }
}
