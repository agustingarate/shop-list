import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/Logic/Login/authentication_provider.dart';
import 'package:shop_list/Logic/Login/splash_provider.dart';

class Splash extends StatelessWidget {
  late AuthenticationProvider authenticationProvider;
  late SplashProvider splashProvider;
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    authenticationProvider = Provider.of<AuthenticationProvider>(context);
    splashProvider = SplashProvider(authenticationProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Navigator.of(context).pushNamed(splashProvider.route!);
      },
    );

    return Container();
  }
}
