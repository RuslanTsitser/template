import 'package:pdf_editor/core/services/local_storage_service/local_storage_service.dart';
import 'package:pdf_editor/features/auth/domain/auth_repository.dart';

class AuthRepositoryLocalStorageImpl implements AuthRepository {
  final LocalStorageService _localStorageService;

  AuthRepositoryLocalStorageImpl({required LocalStorageService localStorageService})
      : _localStorageService = localStorageService;

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    await _localStorageService.signIn(email, password);
    return true;
  }

  @override
  Future<bool> checkAuth() {
    return _localStorageService.isAuthenticated();
  }
}
