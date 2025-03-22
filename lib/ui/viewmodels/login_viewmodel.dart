import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String? errorMessage;
  bool isLoading = false;

  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;

  Future<void> login() async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      errorMessage = null;
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
    isLoading = false;
    notifyListeners();
  }
}