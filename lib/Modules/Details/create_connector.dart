import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/Action/notes_actions.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Modules/Details/screen.dart';
import 'package:redux/redux.dart';

// ignore: must_be_immutable
class CreateNoteConnector extends StatelessWidget {
  CreateNoteConnector({Key? key}) : super(key: key);

  var _isCreating = false;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, DetailsProps>(
      distinct: true,
      converter: (store) {
        if (_isCreating == true && store.state.notes.isCreating == false) {
          Navigator.of(context).pop();
        }

        _isCreating = store.state.notes.isCreating;

        return DetailsProps(
            note: null,
            create: (title, subtitle) => store
                .dispatch(CreateNoteAction(title: title, subtitle: subtitle)),
            back: Navigator.of(context).pop,
            isDownloading: store.state.notes.isCreating);
      },
      builder: (context, props) => DetailsScreen(props: props));
}
