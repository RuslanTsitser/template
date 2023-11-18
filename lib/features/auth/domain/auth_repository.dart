abstract class AuthRepository {
  Future<bool> signInWithEmailAndPassword(String email, String password);
  Future<bool> checkAuth();
}
