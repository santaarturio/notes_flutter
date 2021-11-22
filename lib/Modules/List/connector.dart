import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Details/create_connector.dart';
import 'package:notes/Modules/Details/details_connector.dart';
import 'package:notes/Modules/List/screen.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class NotesConnector extends StatelessWidget {
  const NotesConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NotesProps>(
      distinct: true,
      onInit: (store) => store.dispatch(ReloadNotesAction()),
      converter: (Store<AppState> store) => NotesProps(
          notes: store.state.notes.list,
          isDownloading: store.state.notes.isDownloading,
          create: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateNoteConnector())),
          details: (note) => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsConnector(note: note))),
          logout: () => store.dispatch(LogOutAction())),
      builder: (context, props) => NotesScreen(props: props));
}
