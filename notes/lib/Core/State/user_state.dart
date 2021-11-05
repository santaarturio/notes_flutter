// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Model/user_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_state.g.dart';

@CopyWith(generateCopyWithNull: true)
class UserState extends Equatable {
  final User? me;

  const UserState({this.me});

  @override
  List<Object?> get props => [me];

  static const defaultValue = UserState(me: null);
}

extension UserStateReducer on UserState {
  static UserState reduce(UserState state, action) {
    switch (action.runtimeType) {
      case DidLoginAction:
        return state.copyWith(me: action.user);

      case LogOutAction:
        return state.copyWithNull();

      default:
        return state;
    }
  }
}
