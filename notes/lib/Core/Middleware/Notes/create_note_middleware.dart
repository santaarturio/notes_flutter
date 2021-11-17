// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/Plugins/401_validator.dart';
import 'package:notes/Service/notes_service.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final createNoteMiddleware = (
  Store<AppState> store,
  CreateNoteAction action,
  NextDispatcher next,
) {
  next(action);

  if (store.state.notes.isCreating) {
    return;
  }

  next(CreatingNoteAction());

  NotesService(NotesService.dio(
          jwt: store.state.user.me?.jwt, validateStatus: Validator401.validate))
      .createNote(action.title, action.subtitle)
      .then((note) => next(DidCreateNoteAction(note: note)))
      .onError((error, stackTrace) =>
          next(DidFailCreateNoteAction(error: error as DioError)));
};
