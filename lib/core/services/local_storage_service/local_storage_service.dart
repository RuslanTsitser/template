import 'package:pdf_editor/core/services/local_storage_service/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<bool> isAuthenticated();
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}

class LocalStorageServiceImpl implements LocalStorageService {
  @override
  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(StorageKeys.isAuthenticated) ?? false;
  }

  @override
  Future<void> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setBool(StorageKeys.isAuthenticated, true),
      prefs.setString(StorageKeys.email, email),
      prefs.setString(StorageKeys.password, password),
    ]);
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setBool(StorageKeys.isAuthenticated, false),
      prefs.remove(StorageKeys.email),
      prefs.remove(StorageKeys.password),
    ]);
  }
}
