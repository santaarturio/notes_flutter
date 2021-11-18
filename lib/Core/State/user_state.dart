// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Model/user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_state.g.dart';

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
  static UserState reduce(UserState state, action) {
    switch (action.runtimeType) {
      case PrecessingLoginAction:
        return state.copyWith(loginInProgress: true);

      case DidLoginAction:
        return state.copyWith(me: action.user, loginInProgress: false);

      case DidFailLoginAction:
        return state.copyWith(loginInProgress: false);

      case LogOutAction:
        return state.copyWithNull(me: true);

      default:
        return state;
    }
  }
}
