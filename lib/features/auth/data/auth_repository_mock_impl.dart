import 'package:pdf_editor/features/auth/domain/auth_repository.dart';

class AuthRepositoryMockImpl implements AuthRepository {
  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

  @override
  Future<bool> checkAuth() {
    return Future.delayed(const Duration(seconds: 2), () => true);
  }
}
