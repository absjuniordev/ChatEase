import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chate_ease/core/models/chat_user.dart';

import 'auth_service.dart';

class AuthMockService implements AuthService {
  //Usuario padrão
  static final _userDefult = ChatUser(
      id: "1",
      name: "Fagner",
      email: "fau@hotmail.com",
      imageUrl: "assets/image/avatar.png");
  static final Map<String, ChatUser> _users = {
    _userDefult.email: _userDefult,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_userDefult);
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
  Future<void> sigunp(
      String name, String email, String password, File? image) async {
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
