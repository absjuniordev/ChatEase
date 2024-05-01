import 'package:chate_ease/pages/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chate Ease',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const AuthPage(),
    );
  }
}
