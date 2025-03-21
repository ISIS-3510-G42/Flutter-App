import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String name = '';
  String? errorMessage;
  bool isLoading = false;

  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;
  void setConfirmPassword(String value) => confirmPassword = value;
  void setName(String value) => name = value;

  Future<void> register() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    if (password != confirmPassword) {
      errorMessage = 'Las contraseñas no coinciden';
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        errorMessage = null;
      } on FirebaseAuthException catch (e) {
        errorMessage = e.message;
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
