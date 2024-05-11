import 'package:chate_ease/components/new_message.dart';
import 'package:chate_ease/core/services/auth/auth_service.dart';
import 'package:chate_ease/core/services/notification/chat_notification_service.dart';
import 'package:chate_ease/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/messages.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juniores"),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: const [
                DropdownMenuItem(
                  value: "logout",
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(height: 10),
                        Text("Sair")
                      ],
                    ),
                  ),
                )
              ],
              onChanged: (value) {
                if (value == "logout") {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return const NotificationPage();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    "${Provider.of<ChathNotificationService>(context).itemsCount}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      //Teste de nofiticações
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChathNotificationService>(
      //       context,
      //       listen: false,
      //     ).add(
      //       ChatNotification(
      //         title: 'Mais uma notifcação',
      //         body: Random().nextDouble().toString(),
      //       ),
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
