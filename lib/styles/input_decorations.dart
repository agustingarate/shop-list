import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration login({
    required String labelText,
    required BuildContext context,
    IconData? icon,
  }) {
    return InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        labelText: labelText,
        labelStyle: const TextStyle(),
        suffixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.white,
              )
            : null);
  }
}
