import 'package:chate_ease/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChathNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notificações'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, idx) {
          return ListTile(
            title: Text(items[idx].title),
            subtitle: Text(items[idx].body),
            onTap: () => service.remove(idx),
          );
        },
      ),
    );
  }
}
