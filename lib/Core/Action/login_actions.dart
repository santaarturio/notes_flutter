import 'package:notes/Core/Action/error_action.dart';
import 'package:notes/Model/user.dart';

// Trigger
class SignInAction {
  final String email;
  final String password;

  SignInAction({required this.email, required this.password});
}

class SignUpAction {
  final String? name;
  final String email;
  final String password;

  SignUpAction({this.name, required this.email, required this.password});
}

// Progress
class PrecessingLoginAction {}

// Did Login
class DidLoginAction {
  final User user;

  DidLoginAction({required this.user});
}

// Did Fail Login
class DidFailLoginAction implements ErrorAction {
  @override
  Exception error;

  DidFailLoginAction({required this.error});
}

// Log Out
class LogOutAction {}
