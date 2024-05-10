import 'dart:io';

import 'package:chate_ease/core/models/chat_user.dart';
import 'package:chate_ease/core/services/auth/auth_firebase_service.dart';
// import 'package:chate_ease/core/services/auth/auth_mock_service.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanger;

  Future<void> sigunp(String name, String email, String password, File? image);
  Future<void> login(String name, String email);
  Future<void> logout();

  factory AuthService() {
    // return AuthMockService();
    return AuthFirebaseService();
  }
}
