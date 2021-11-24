import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Details/Create/navigator.dart';
import 'package:notes/Modules/Details/screen.dart';

// ignore: must_be_immutable
class CreateNoteConnector extends StatelessWidget {
  final _navigator = CreateNoteNavigator();

  CreateNoteConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, DetailsProps>(
      distinct: true,
      converter: (store) => DetailsProps(
            note: null,
            create: (title, subtitle) => store
                .dispatch(CreateNoteAction(title: title, subtitle: subtitle)),
            back: _navigator.navigateBack,
            isDownloading: store.state.notes.isCreating,
          ),
      onWillChange: (previous, current) {
        if (previous?.isDownloading == true && current.isDownloading == false) {
          _navigator.navigateBack();
        }
      },
      builder: (context, props) => DetailsScreen(props: props));
}
