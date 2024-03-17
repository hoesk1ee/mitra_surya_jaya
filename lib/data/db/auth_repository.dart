import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final String stateKey = 'state';
  final String userKey = 'user';

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return prefs.getBool(stateKey) ?? false;
  }

  Future<bool> login() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(stateKey, false);
  }
}
