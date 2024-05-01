import 'package:flutter/material.dart';

class LoadindPage extends StatelessWidget {
  const LoadindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator.adaptive(
              backgroundColor:
                  Theme.of(context).primaryTextTheme.headlineSmall?.color,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Carregando...",
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.titleLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
