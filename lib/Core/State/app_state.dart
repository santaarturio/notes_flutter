// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'user_state.dart';
import 'notes_state.dart';

class AppState extends Equatable {
  final UserState user;
  final NotesState notes;

  const AppState({required this.user, required this.notes});

  @override
  List<Object?> get props => [user, notes];

  static const defaultValue =
      AppState(user: UserState.defaultValue, notes: NotesState.defaultValue);
}

extension AppStateReducer on AppState {
  static AppState reduce(AppState state, action) {
    return AppState(
        user: UserStateReducer.reduce(state.user, action),
        notes: NotesStateReducer.reduce(state.notes, action));
  }
}
