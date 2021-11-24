import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Login/Screen.dart';
import 'package:notes/Modules/Login/sign_up/navigator.dart';

class SignUpConnector extends StatelessWidget {
  final _navigator = SignUpNavigator();

  SignUpConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginProps>(
        converter: (store) => LoginProps(
            isLoginInProgress: store.state.user.loginInProgress,
            canSignUp: false,
            signUp: () {},
            back: _navigator.navigateBack,
            login: (name, email, password) => store.dispatch(
                SignUpAction(name: name, email: email, password: password))),
        builder: (context, props) => LoginScreen(props: props),
      );
}
