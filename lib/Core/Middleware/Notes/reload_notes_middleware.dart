// ignore_for_file: prefer_function_declarations_over_variables

import 'package:get_it/get_it.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/notes_api.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final reloadNotesMiddleware = (
  Store<AppState> store,
  ReloadNotesAction action,
  NextDispatcher next,
) async {
  next(action);

  if (store.state.notes.isDownloading) {
    return;
  }

  next(ReloadingNotesAction());

  try {
    next(DidReloadNotesAction(
        notes: await GetIt.instance<NotesAPI>()
            .notes('Bearer ${store.state.user.me?.jwt ?? ''}')));
  } catch (error) {
    next(DidFailReloadNotesAction(error: error as DioError));
  }
};
