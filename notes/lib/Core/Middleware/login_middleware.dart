import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/login_service.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

void loginMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action.runtimeType == LoginAction && store.state.user.loginInProgress ||
      action.runtimeType != LoginAction) {
    return;
  }

  final loginService = LoginService(Dio());

  switch (action.loginType) {
    case LoginType.signIn:
      loginService
          .signin(action.email, action.password)
          .then((user) => next(DidLoginAction(user: user)))
          .onError((error, stackTrace) =>
              next(DidFailLoginAction(error: (error as DioError))));
      break;

    case LoginType.signUp:
      loginService
          .signup(action.name, action.email, action.password)
          .then((user) => next(DidLoginAction(user: user)))
          .onError((error, stackTrace) =>
              next(DidFailLoginAction(error: (error as DioError))));
      break;
  }
}
