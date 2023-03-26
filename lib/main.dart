import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/Logic/Login/authentication_provider.dart';
import 'package:shop_list/Logic/Login/sign_up_provider.dart';
import 'package:shop_list/Logic/Login/splash_provider.dart';
import 'package:shop_list/Logic/cart_provider.dart';
import 'package:shop_list/Logic/category_provider.dart';
import 'package:shop_list/Logic/product_provider.dart';
import 'package:shop_list/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Logic/Login/sign_in_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpProvider(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(
          create: (_) => SignInProvider(FirebaseAuth.instance),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
