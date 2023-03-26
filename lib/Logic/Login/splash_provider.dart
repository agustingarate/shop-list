import 'package:flutter/material.dart';
import 'package:shop_list/Logic/Login/authentication_provider.dart';

class SplashProvider {
  final AuthenticationProvider authenticationProvider;
  String? _route;
  SplashProvider(this.authenticationProvider) {
    _validate();
  }

  String? get route => _route;

  void _validate() {
    if (authenticationProvider.user == null) {
      _route = "/PreLogin";
    } else {
      _route = "/";
    }

    ChangeNotifier();
  }
}
