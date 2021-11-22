// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/error_action.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Misc/cast.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final error401Middleware = (
  Store<AppState> store,
  ErrorAction action,
  NextDispatcher next,
) {
  next(action);

  if (cast<DioError>(action.error)?.response?.statusCode == 401) {
    next(LogOutAction());
  }
};
