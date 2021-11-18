// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../Core/State/user_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension UserStateCopyWith on UserState {
  UserState copyWith({
    bool? loginInProgress,
    User? me,
  }) {
    return UserState(
      loginInProgress: loginInProgress ?? this.loginInProgress,
      me: me ?? this.me,
    );
  }

  UserState copyWithNull({
    bool me = false,
  }) {
    return UserState(
      loginInProgress: loginInProgress,
      me: me == true ? null : this.me,
    );
  }
}
