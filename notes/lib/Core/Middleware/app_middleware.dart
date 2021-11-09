import 'package:notes/Core/Middleware/login_middleware.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:redux/redux.dart';
import 'logger_middleware.dart';

class AppMiddleware {
  static List<
          dynamic Function(Store<AppState>, dynamic, dynamic Function(dynamic))>
      middleware = [
    loginMiddleware,
    loggerMiddleware, // loggerMiddleware should always be last in the chain
  ];
}
