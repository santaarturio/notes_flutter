// ignore_for_file: file_names, prefer_function_declarations_over_variables

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
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
  static final Reducer<AppState> reduce = (state, action) => AppState(
      user: UserStateReducer.reduce(state.user, action),
      notes: NotesStateReducer.reduce(state.notes, action));
}
