import 'package:notes/Core/Middleware/sign_in_middleware.dart';
import 'package:notes/Core/Middleware/sign_up_middleware.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:redux/redux.dart';
import 'logger_middleware.dart';

class AppMiddleware {
  static final List<Middleware<AppState>> middleware = [
    TypedMiddleware(signInMiddleware),
    TypedMiddleware(signUpMiddleware),
    loggerMiddleware, // loggerMiddleware should always be last in the chain
  ];
}
