// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/notes_api.dart';
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

  NotesService(Dio())
      .notes('Bearer ${store.state.user.me?.jwt ?? ''}')
      .then((notes) => next(DidReloadNotesAction(notes: notes)))
      .onError((error, stackTrace) =>
          next(DidFailReloadNotesAction(error: error as DioError)));
};
