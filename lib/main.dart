import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Middleware/app_middleware.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Misc/assembler.dart';
import 'package:notes/Modules/Root/root_connector.dart';
import 'package:redux/redux.dart';

void main() {
  Assembler.registerDependencies();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<AppState>(AppStateReducer.reduce,
          initialState: AppState.defaultValue,
          middleware: AppMiddleware.middleware),
      child: const MaterialApp(
        title: 'Notes',
        home: RootConnector(),
      ),
    );
  }
}
