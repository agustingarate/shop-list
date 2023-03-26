import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/models/sign_in_response.dart';

enum LoginException {
  wrongPassword('wrong-password', "Contraseña incorrecta"),
  invalidEmail('invalid-email', "Email invalido"),
  userDisabled('user-disabled:', "Usuario no habilitado"),
  userNotFound('user-not-found', "Usuario no encontrado"),
  uknownError('uknown-error', "Hubo un error, vuelva a intentarlo");

  const LoginException(this.exception, this.mensaje);

  final String exception;
  final String mensaje;
}

class SignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInProvider(
    this._auth,
  );

  Future<SignInResponse> signInFirebase(SignInData data) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: data.emailAdress, password: data.password);
      return SignInResponse(credential.user, null);
    } on FirebaseAuthException catch (e) {
      return SignInResponse(null, e.code);
    }
  }

  Future<SignInResponse> signIn() async {
    final signUpData = SignInData(
      emailAdress: emailController.text,
      password: passwordController.text,
    );

    final response = await signInFirebase(signUpData);
    return response;
  }

  LoginException getLoginException(String code) {
    switch (code) {
      case "wrong-password":
        return LoginException.wrongPassword;
      case "invalid-email":
        return LoginException.invalidEmail;
      case "user-disabled":
        return LoginException.userDisabled;
      case "user-not-found":
        return LoginException.userDisabled;
      default:
        return LoginException.uknownError;
    }
  }
}
