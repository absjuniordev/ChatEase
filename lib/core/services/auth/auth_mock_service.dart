import 'dart:io';

import 'package:chate_ease/core/models/chat_user.dart';

import 'auth_service.dart';

class AuthMockService implements AuthService {
  @override
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  Stream<ChatUser?> get userChanger => throw UnimplementedError();

  @override
  Future<void> login(String name, String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> sigunp(String name, String email, File image) {
    throw UnimplementedError();
  }
}
