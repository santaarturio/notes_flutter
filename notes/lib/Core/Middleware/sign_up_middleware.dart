// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/login_service.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final signUpMiddleware = (
  Store<AppState> store,
  SignUpAction action,
  NextDispatcher next,
) {
  LoginService(Dio())
      .signup(action.name, action.email, action.password)
      .then((user) => next(DidLoginAction(user: user)))
      .onError((error, stackTrace) =>
          next(DidFailLoginAction(error: (error as DioError))));

  next(action);
};
