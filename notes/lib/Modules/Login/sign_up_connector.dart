import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Login/Screen.dart';
import 'package:redux/redux.dart';

class SignUpConnector extends StatelessWidget {
  const SignUpConnector({Key? key}) : super(key: key);

  LoginProps _converter(Store<AppState> store) {
    final isLoginInProgress = store.state.user.loginInProgress;
    const canSignUp = false;

    void login(String? name, String email, String password) {
      store.dispatch(LoginAction(
          loginType: LoginType.signUp,
          email: email,
          password: password,
          name: name));
    }

    return LoginProps(isLoginInProgress, canSignUp, login);
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginProps>(
        converter: _converter,
        builder: (context, props) => LoginScreen(props: props),
      );
}
