class UserAuth {
  String _email = '';
  String _password = '';

  String get getEmail => _email;

  set setEmail(String value) {
    _email = value;
  }

  String get getPassword => _password;

  set setPassword(String value) {
    _password = value;
  }
}