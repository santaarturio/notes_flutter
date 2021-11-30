import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Factory/factory.dart';

class RootConnector extends StatelessWidget {
  final ScreenFactory _factory = GetIt.instance<ScreenFactory>();

  RootConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.user.me != null,
        builder: (context, isLoggedIn) => isLoggedIn
            ? _factory.makeNotesScreen()
            : _factory.makeSignInScreen(),
      );
}
