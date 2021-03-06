import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Login/Screen.dart';
import 'package:notes/Modules/Login/sign_in/navigator.dart';

class SignInConnector extends StatelessWidget {
  final _navigator = SignInNavigator();

  SignInConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginProps>(
        converter: (store) => LoginProps(
            isLoginInProgress: store.state.user.loginInProgress,
            canSignUp: true,
            signUp: _navigator.navigateToSignUp,
            back: () {},
            login: (_, email, password) =>
                store.dispatch(SignInAction(email: email, password: password))),
        builder: (context, props) => LoginScreen(props: props),
      );
}
