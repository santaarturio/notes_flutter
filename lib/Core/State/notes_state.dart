// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Model/note_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'notes_state.g.dart';

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
  static NotesState reduce(NotesState state, action) {
    switch (action.runtimeType) {
      case ReloadingNotesAction:
        return state.copyWith(isDownloading: true);

      case DidReloadNotesAction:
        return state.copyWith(list: action.notes, isDownloading: false);

      case DidFailReloadNotesAction:
        return state.copyWith(isDownloading: false);

      case CreatingNoteAction:
        return state.copyWith(isCreating: true);

      case DidCreateNoteAction:
        final list = state.list;
        list.insert(0, action.note);
        return state.copyWith(list: list, isCreating: false);

      case DidFailCreateNoteAction:
        return state.copyWith(isCreating: false);

      default:
        return state;
    }
  }
}
