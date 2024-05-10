import 'dart:io';

import 'package:chate_ease/components/user_image_picker.dart';
import 'package:flutter/material.dart';

import 'package:chate_ease/core/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({
    super.key,
    required this.onSubmit,
  });
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePicker(File image) {
    _formData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _submit() {
    final isValidate = _formKey.currentState?.validate() ?? false;
    if (!isValidate) return;

    if (_formData.image == null && _formData.isSignup) {
      return _showError("Imagem não selecionada");
    }
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (!_formData.isLogin)
                UserImagePicker(onImagePicker: _handleImagePicker),
              if (!_formData.isLogin)
                TextFormField(
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  key: const ValueKey('name'),
                  decoration: const InputDecoration(labelText: "Nome"),
                  validator: (_name) {
                    final name = _name ?? "";
                    if (name.trim().length < 5) {
                      return "Nome deve ter no minimo 5 Caracteres";
                    }
                    return null;
                  },
                ),
              TextFormField(
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                key: const ValueKey('email'),
                decoration: const InputDecoration(labelText: "Email"),
                validator: (_email) {
                  final name = _email ?? "";
                  if (!name.contains("@")) {
                    return "O email informado não é válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(labelText: "Senha"),
                validator: (_password) {
                  final name = _password ?? "";
                  if (name.trim().length < 5) {
                    return "Senha deve ter no minimo 5 Caracteres";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? "Entrar" : "Cadastrar?"),
              ),
              TextButton(
                child: Text(
                  _formData.isLogin
                      ? "Criar uma nova conta?"
                      : "Ja possui conta?",
                ),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
