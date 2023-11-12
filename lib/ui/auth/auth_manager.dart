import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../models/auth_token.dart';
import '../../services/auth_service.dart';

class AuthManager with ChangeNotifier {
  AuthToken? _authToken;

  final AuthService _authService = AuthService();

  bool get isAuth {
    return authToken != null && authToken!.isValid;
  }

  String get emailAuth {
    return authToken!.email;
  }

  AuthToken? get authToken {
    return _authToken;
  }

  void _setAuthToken(AuthToken? token) {
    _authToken = token;
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    _setAuthToken(await _authService.signup(email, password));
  }

  Future<void> login(String email, String password) async {
    // print(await _authService.checkLogin(email, password));
    _setAuthToken(await _authService.checkLogin(email, password));
  }

  Future<bool> tryAutoLogin() async {
    final savedToken = await _authService.loadSavedAuthToken();
    if (savedToken == null) {
      return false;
    }

    _setAuthToken(savedToken);
    return true;
  }

  Future<void> logout() async {
    _authToken = null;
    notifyListeners();
    _authService.clearSavedAuthToken();
  }
}
