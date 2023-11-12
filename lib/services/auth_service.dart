import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:app_nshopping/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/http_exception.dart';
import '../models/auth_token.dart';

class AuthService {
  static var client = http.Client();

  static const _authTokenKey = 'authToken';
  late final String? _apiKey;

  // AuthService() {
  //   _apiKey = dotenv.env['FIREBASE_API_KEY'];
  // }

  String _buildAuthUrl(String method) {
    return 'https://identitytoolkit.googleapis.com/v1/accounts:$method?key=$_apiKey';
  }

  Future<AuthToken?> checkLogin(String email, String password) async {
    // print("adasdasd");
    final Map<dynamic, dynamic> authToken = {};

    try {
      Map<String, String> requestHearders = {
        'Content-Type': 'application/json'
      };
      var url = Uri.http(Config.apiURL, Config.apiLoginURL);
      var response = await client.post(url,
          headers: requestHearders,
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }));
      if (response.statusCode == 200) {
        final auth = json.decode(response.body) as Map<String, dynamic>;

        // print(auth);
        final authToken = AuthToken(
          token: auth['token'],
          email: auth['email'],
        );
        print(authToken);
        return authToken;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<AuthToken> _authenticate(
      String email, String password, String method) async {
    try {
      final url = Uri.parse(_buildAuthUrl(method));
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseJson = json.decode(response.body);
      if (responseJson['error'] != null) {
        throw HttpException.firebase(responseJson['error']['message']);
      }

      final authToken = _fromJson(responseJson);
      _saveAuthToken(authToken);

      return authToken;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<AuthToken> signup(String email, String password) {
    return _authenticate(email, password, 'signUp');
  }

  Future<AuthToken> login(String email, String password) {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> _saveAuthToken(AuthToken authToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_authTokenKey, json.encode(authToken.toJson()));
  }

  AuthToken _fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['idToken'],
      email: json['localId'],
    );
  }

  Future<AuthToken?> loadSavedAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_authTokenKey)) {
      return null;
    }

    final savedToken = prefs.getString(_authTokenKey);

    final authToken = AuthToken.fromJson(json.decode(savedToken!));
    if (!authToken.isValid) {
      return null;
    }
    return authToken;
  }

  Future<void> clearSavedAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_authTokenKey);
  }
}
