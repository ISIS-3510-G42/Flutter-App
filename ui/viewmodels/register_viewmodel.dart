import 'package:flutter/foundation.dart';

class RegisterViewModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String? errorMessage;
  bool isLoading = false;

  void setName(String value) => name = value;
  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;
  void setConfirmPassword(String value) => confirmPassword = value;

  Future<void> register() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Simulación simple
    await Future.delayed(const Duration(seconds: 2));
    if (password != confirmPassword) {
      errorMessage = 'Las contraseñas no coinciden';
    } else {
      // Aquí va tu lógica de Firebase/Auth...
      errorMessage = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
