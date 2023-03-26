import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInData {
  String emailAdress, password;

  SignInData({
    required this.emailAdress,
    required this.password,
  });
}

class SignInResponse {
  final User? user;
  final String? error;

  SignInResponse(this.user, this.error);
}
