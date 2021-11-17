import 'package:notes/Core/Middleware/Notes/create_note_middleware.dart';
import 'package:notes/Core/Middleware/Notes/reload_notes_middleware.dart';
import 'package:notes/Core/Middleware/Login/sign_in_middleware.dart';
import 'package:notes/Core/Middleware/Login/sign_up_middleware.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:redux/redux.dart';
import 'logger_middleware.dart';

class AppMiddleware {
  static final List<Middleware<AppState>> middleware = [
    TypedMiddleware(signInMiddleware),
    TypedMiddleware(signUpMiddleware),
    TypedMiddleware(reloadNotesMiddleware),
    TypedMiddleware(createNoteMiddleware),
    loggerMiddleware, // loggerMiddleware should always be last in the chain
  ];
}
