// ignore_for_file: file_names, prefer_function_declarations_over_variables

import 'package:equatable/equatable.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Model/note.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:redux/redux.dart';

part '../../Misc/Generated/notes_state.g.dart';

@CopyWith()
class NotesState extends Equatable {
  final List<Note> list;
  final bool isDownloading;
  final bool isCreating;

  const NotesState(
      {required this.list,
      this.isDownloading = false,
      this.isCreating = false});

  @override
  List<Object?> get props => [list];

  static const defaultValue = NotesState(list: [], isDownloading: false);
}

extension NotesStateReducer on NotesState {
  static final Reducer<NotesState> reduce = combineReducers([
    TypedReducer(reloadingNotesReducer),
    TypedReducer(didReloadNotesReducer),
    TypedReducer(didFailReloadNotesReducer),
    TypedReducer(creatingNotesReducer),
    TypedReducer(didCreateNotesReducer),
    TypedReducer(didFailCreateNotesReducer)
  ]);

  static final reloadingNotesReducer =
      (NotesState state, ReloadingNotesAction action) =>
          state.copyWith(isDownloading: true);

  static final didReloadNotesReducer =
      (NotesState state, DidReloadNotesAction action) =>
          state.copyWith(list: action.notes, isDownloading: false);

  static final didFailReloadNotesReducer =
      (NotesState state, DidFailReloadNotesAction action) =>
          state.copyWith(isDownloading: false);

  static final creatingNotesReducer =
      (NotesState state, CreatingNoteAction action) =>
          state.copyWith(isCreating: true);

  static final didCreateNotesReducer =
      (NotesState state, DidCreateNoteAction action) {
    final list = state.list;
    list.insert(0, action.note);
    return state.copyWith(list: list, isCreating: false);
  };

  static final didFailCreateNotesReducer =
      (NotesState state, DidFailCreateNoteAction action) =>
          state.copyWith(isCreating: false);
}
