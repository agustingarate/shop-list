import 'package:shop_list/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpResponse {
  final User? user;
  final String? error;

  SignUpResponse(this.user, this.error);
}

class SignUpData {
  final String email, name, surname, password;

  SignUpData({
    required this.email,
    required this.name,
    required this.surname,
    required this.password,
  });
}
