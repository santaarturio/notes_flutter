import 'package:notes/Core/State/app_state.dart';
import 'package:redux/redux.dart';

void loggerMiddleware(Store<AppState> store, action, NextDispatcher next) {
  // ignore: avoid_print
  print('>>> Action: ${action.runtimeType}');
  next(action);
}
