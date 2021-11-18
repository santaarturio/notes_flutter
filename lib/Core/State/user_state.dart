// ignore_for_file: file_names, prefer_function_declarations_over_variables

import 'package:equatable/equatable.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Model/user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:redux/redux.dart';

part '../../Misc/Generated/user_state.g.dart';

@CopyWith(generateCopyWithNull: true)
class UserState extends Equatable {
  final User? me;
  final bool loginInProgress;

  const UserState({this.me, this.loginInProgress = false});

  @override
  List<Object?> get props => [me];

  static const defaultValue = UserState(me: null);
}

extension UserStateReducer on UserState {
  static final Reducer<UserState> reduce = combineReducers([
    TypedReducer(processingLoginReducer),
    TypedReducer(didLoginReducer),
    TypedReducer(didFailLoginReducer),
    TypedReducer(logoutReducer)
  ]);

  static final processingLoginReducer =
      (UserState state, PrecessingLoginAction action) =>
          state.copyWith(loginInProgress: true);

  static final didLoginReducer = (UserState state, DidLoginAction action) =>
      state.copyWith(me: action.user, loginInProgress: false);

  static final didFailLoginReducer =
      (UserState state, DidFailLoginAction action) =>
          state.copyWith(loginInProgress: false);

  static final logoutReducer =
      (UserState state, LogOutAction action) => state.copyWithNull(me: true);
}
