// ignore_for_file: prefer_function_declarations_over_variables

import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Service/notes_api.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

final createNoteMiddleware = (
  Store<AppState> store,
  CreateNoteAction action,
  NextDispatcher next,
) async {
  next(action);

  if (store.state.notes.isCreating) {
    return;
  }

  next(CreatingNoteAction());

  try {
    next(DidCreateNoteAction(
        note: await NotesAPI(Dio()).createNote(
            'Bearer ${store.state.user.me?.jwt ?? ''}',
            action.title,
            action.subtitle)));
  } catch (error) {
    next(DidFailCreateNoteAction(error: error as DioError));
  }
};
