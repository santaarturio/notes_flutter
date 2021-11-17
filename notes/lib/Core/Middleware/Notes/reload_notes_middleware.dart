// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/Plugins/401_validator.dart';
import 'package:notes/Service/notes_service.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final reloadNotesMiddleware = (
  Store<AppState> store,
  ReloadNotesAction action,
  NextDispatcher next,
) {
  next(action);

  if (store.state.notes.isDownloading) {
    return;
  }

  next(ReloadingNotesAction());

  NotesService(NotesService.dio(
          jwt: store.state.user.me?.jwt, validateStatus: Validator401.validate))
      .notes()
      .then((notes) => next(DidReloadNotesAction(notes: notes)))
      .onError((error, stackTrace) =>
          next(DidFailReloadNotesAction(error: error as DioError)));
};
