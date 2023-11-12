class AuthToken {
  final String _token;
  final String _email;

  AuthToken({
    token,
    email,
  })  : _token = token,
        _email = email;

  bool get isValid {
    return token != null;
  }

  String get token {
    return _token;
  }

  String get email {
    return _email;
  }

  Map<String, dynamic> toJson() {
    return {
      'authToken': _token,
      'email': _email,
    };
  }

  static AuthToken fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['authToken'],
      email: json['email'],
    );
  }
}
