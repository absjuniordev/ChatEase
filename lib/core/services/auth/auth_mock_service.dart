import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chate_ease/core/models/chat_user.dart';

import 'auth_service.dart';

class AuthMockService implements AuthService {
  static final Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanger => _userStream;

  @override
  Future<void> login(String name, String email) async =>
      _updateUser(_users[email]);

  @override
  Future<void> logout() async => _updateUser(null);

  @override
  Future<void> sigunp(String name, String email, File? image) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageUrl: image?.path ?? "assets/image/avatar.png",
    );
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
