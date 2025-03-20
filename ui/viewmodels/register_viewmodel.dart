import 'package:flutter/material.dart';
import '../../data/repositories/user_repository.dart';

class RegisterViewModel extends ChangeNotifier {
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

  Future<void> register() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Llamar al repo para registrar al usuario (Firebase o tu backend)
      await _userRepository.register(_email, _password);
    } catch (e) {
      _errorMessage = 'Error al registrarse: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
