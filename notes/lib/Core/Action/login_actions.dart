import 'package:notes/Model/user_model.dart';

enum LoginType { signIn, signUp }

// Trigger
class LoginAction {
  final LoginType loginType;
  final String? name;
  final String email;
  final String password;

  LoginAction(
      {required this.loginType,
      required this.email,
      required this.password,
      this.name});
}

// Progress
class PrecessingLoginAction {}

// Did Login
class DidLoginAction {
  final User user;

  DidLoginAction({required this.user});
}

// Did Fail Login
class DidFailLoginAction {
  final Error error;

  DidFailLoginAction({required this.error});
}

// Log Out
class LogOutAction {}
