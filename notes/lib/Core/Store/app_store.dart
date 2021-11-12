// ignore_for_file: file_names

import 'package:notes/Core/Middleware/app_middleware.dart';
import 'package:redux/redux.dart';
import 'package:notes/Core/State/app_state.dart';

final store = Store<AppState>(AppStateReducer.reduce,
    initialState: AppState.defaultValue, middleware: AppMiddleware.middleware);
