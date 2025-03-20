import 'package:flutter/material.dart';
import '../../data/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorMessage;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> login() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Llamar al repo para hacer login (Firebase o tu backend)
      await _userRepository.login(_email, _password);
      // Si todo sale bien, no hay error
    } catch (e) {
      _errorMessage = 'Error al iniciar sesión: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
