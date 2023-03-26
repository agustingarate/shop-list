import 'package:flutter/material.dart';

abstract class CustomSnackbar {
  static SnackBar get({required String text}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      content: Text(
        text,
        style: const TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
      ),
      backgroundColor: Colors.red,
      elevation: 10,
    );
  }
}
