import 'package:flutter/material.dart';
import 'package:shop_list/pages/cart.dart';
import 'package:shop_list/pages/category_products_page.dart';
import 'package:shop_list/pages/login.dart';
import 'package:shop_list/pages/pre_login.dart';
import 'package:shop_list/pages/register_page.dart';
import 'package:shop_list/pages/splash.dart';
import 'package:shop_list/styles/color_schemes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.dark,
      initialRoute: "/splash",
      routes: {
        "/": (_) => Cart(),
        "/CategoryProductsPage": (_) => const CategoriesProductsPage(),
        "/PreLogin": (_) => const PreLogin(),
        "/login": (_) => const Login(),
        "/register": (_) => const RegisterPage(),
        "/splash": (_) => Splash(),
      },
    );
  }
}
