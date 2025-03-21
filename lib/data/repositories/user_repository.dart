class UserRepository {
  // Aquí podrías inyectar un FirebaseService o ApiService, según tu lógica
  // final FirebaseService _firebaseService = FirebaseService();

  Future<void> login(String email, String password) async {
    // Lógica de login, por ejemplo:
    // await _firebaseService.signIn(email, password);
    // O tu llamada a una API
  }

  Future<void> register(String email, String password) async {
    // Lógica de registro, por ejemplo:
    // await _firebaseService.register(email, password);
  }
}
