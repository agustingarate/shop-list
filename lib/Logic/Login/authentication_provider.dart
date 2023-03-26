import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _auth;
  User? _user;

  AuthenticationProvider(this._auth) {
    init();
  }

  User? get user => _user;

  void init() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _user == user;
      } else {
        _user == null;
      }
    });
  }
}
