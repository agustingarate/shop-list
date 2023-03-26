import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/models/sign_up_response.dart';

class SignUpProvider extends ChangeNotifier {
  final FirebaseAuth _auth;

  SignUpProvider(this._auth);

  Future<SignUpResponse> signUp(SignUpData signUpData) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: signUpData.email,
        password: signUpData.password,
      );
      await credential.user!.updateDisplayName(signUpData.name);
      return SignUpResponse(credential.user!, null);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(null, e.code);
    } catch (e) {
      return SignUpResponse(null, e.toString());
    }
  }
}
