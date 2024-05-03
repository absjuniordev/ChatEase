import 'dart:io';

import 'package:chate_ease/core/models/chat_user.dart';
import 'package:chate_ease/core/services/auth/auth_mock_service.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanger;

  Future<void> sigunp(String name, String email, File? image);
  Future<void> login(String name, String email);
  Future<void> logout();

  factory AuthService() {
    return AuthMockService();
  }
}
