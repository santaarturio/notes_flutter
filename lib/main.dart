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
      store: Store<AppState>(
        AppStateReducer.reduce,
        initialState: AppState.defaultValue,
        middleware: AppMiddleware.middleware,
      ),
      child: MaterialApp(
        title: 'Notes',
        debugShowCheckedModeBanner: false,
        home: const RootConnector(),
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          hintColor: Colors.grey[800],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue[700],
          ),
          textTheme: TextTheme(
            headline1: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.grey[800]),
            button: const TextStyle(fontSize: 18),
          ),
          fontFamily: 'Noto_Sans',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.white,
          hintColor: Colors.grey,
          textTheme: TextTheme(
            headline1: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.grey[200],
            ),
            button: const TextStyle(fontSize: 18),
          ),
          fontFamily: 'Noto_Sans',
        ),
      ),
    );
  }
}
