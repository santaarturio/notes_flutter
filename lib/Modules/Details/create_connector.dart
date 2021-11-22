import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Details/screen.dart';

// ignore: must_be_immutable
class CreateNoteConnector extends StatelessWidget {
  const CreateNoteConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, DetailsProps>(
      distinct: true,
      converter: (store) => DetailsProps(
            note: null,
            create: (title, subtitle) => store
                .dispatch(CreateNoteAction(title: title, subtitle: subtitle)),
            back: Navigator.of(context).pop,
            isDownloading: store.state.notes.isCreating,
          ),
      onWillChange: (previous, current) {
        if (previous?.isDownloading == true && current.isDownloading == false) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, props) => DetailsScreen(props: props));
}
