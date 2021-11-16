import 'package:notes/Model/user_model.dart';

// Trigger
class SignInAction {
  final String email;
  final String password;

  SignInAction(this.email, this.password);
}

class SignUpAction {
  final String? name;
  final String email;
  final String password;

  SignUpAction(this.name, this.email, this.password);
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
  final Exception error;

  DidFailLoginAction({required this.error});
}

// Log Out
class LogOutAction {}
