import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/List/screen.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class NotesConnector extends StatelessWidget {
  NotesConnector({Key? key}) : super(key: key);

  var _isInitial = true;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NotesProps>(
      distinct: true,
      converter: (Store<AppState> store) {
        if (_isInitial) {
          store.dispatch(ReloadNotesAction());
          _isInitial = false;
        }

        return NotesProps(
            notes: store.state.notes.list,
            isDownloading: store.state.notes.isDownloading,
            logout: () => store.dispatch(LogOutAction()));
      },
      builder: (context, props) => NotesScreen(props: props));
}
