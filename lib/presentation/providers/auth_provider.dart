import 'package:flutter/material.dart';
import 'package:mitra_surya_jaya/data/db/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider(this.authRepository);

  bool isLoadingLogin = false;
  bool isLoggedIn = false;

  Future<void> userLogin() async {
    isLoadingLogin = true;
    notifyListeners();

    await authRepository.login();
    notifyListeners();

    isLoggedIn = await authRepository.isLoggedIn();
    isLoadingLogin = false;
    notifyListeners();
  }

  Future<bool> userLoggedIn() async {
    final userState = await authRepository.isLoggedIn();
    return userState;
  }

  Future<void> userLogout() async {
    await authRepository.logout();
    notifyListeners();
  }
}
