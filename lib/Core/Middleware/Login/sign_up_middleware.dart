// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/login_api.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final signUpMiddleware = (
  Store<AppState> store,
  SignUpAction action,
  NextDispatcher next,
) async {
  next(action);

  if (store.state.user.loginInProgress) {
    return;
  }

  next(PrecessingLoginAction());

  try {
    next(DidLoginAction(
        user: await LoginAPI(Dio())
            .signup(action.name, action.email, action.password)));
  } catch (error) {
    next(DidFailLoginAction(error: (error as DioError)));
  }
};
