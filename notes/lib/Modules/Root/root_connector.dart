import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Core/Store/app_store.dart';
import 'package:notes/Modules/Login/sign_in_connector.dart';

class RootConnector extends StatelessWidget {
  const RootConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.user.me != null,
        builder: (context, isLoggedIn) =>
            isLoggedIn ? const Notes() : const SignInConnector(),
      );
}

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.dispatch(ReloadNotesAction());
    return const Text('notes');
  }
}
