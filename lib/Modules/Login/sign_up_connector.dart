import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Login/Screen.dart';

class SignUpConnector extends StatelessWidget {
  const SignUpConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginProps>(
        converter: (store) => LoginProps(
            isLoginInProgress: store.state.user.loginInProgress,
            canSignUp: false,
            signUp: () {},
            back: Navigator.of(context).pop,
            login: (name, email, password) => store.dispatch(
                SignUpAction(name: name, email: email, password: password))),
        builder: (context, props) => LoginScreen(props: props),
      );
}
