import 'dart:async';
import 'dart:io';

import 'package:chate_ease/core/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static final _userStream = Stream<ChatUser?>.multi(
    (controller) async {
      final authChabges = FirebaseAuth.instance.authStateChanges();
      await for (final user in authChabges) {
        _currentUser = user == null ? null : _toChatUser(user);
        controller.add(_currentUser);
      }
    },
  );

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Stream<ChatUser?> get userChanger => _userStream;

  @override
  Future<void> login(String name, String email) async => {};

  @override
  Future<void> sigunp(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user != null) return;
    credential.user?.updateDisplayName(name);
    // credential.user?.updatePhotoURL(photoURL);
  }

  @override
  Future<void> logout() async => FirebaseAuth.instance.signOut();

  static ChatUser _toChatUser(User user) {
    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageUrl: user.photoURL ?? "assets/image/avatar.png",
    );
  }
}
