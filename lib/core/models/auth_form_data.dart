import 'dart:io';

enum AuthMode { login, signup }

class AuthFormData {
  String name = "";
  String email = "";
  String password = "";
  File? image;
  AuthMode _mode = AuthMode.login;

  bool get isLogin {
    return _mode == AuthMode.login;
  }

  bool get isSignup {
    return _mode == AuthMode.signup;
  }

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }
}
