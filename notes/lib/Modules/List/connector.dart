import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Core/Store/app_store.dart';
import 'package:notes/Modules/List/screen.dart';
import 'package:redux/redux.dart';

class NotesConnector extends StatelessWidget {
  NotesConnector({Key? key}) : super(key: key) {
    store.dispatch(ReloadNotesAction());
  }

  void logout() {
    store.dispatch(LogOutAction());
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NotesProps>(
      distinct: true,
      converter: (Store<AppState> store) => NotesProps(
          store.state.notes.list, store.state.notes.isDownloading, logout),
      builder: (context, props) => NotesScreen(props: props));
}
