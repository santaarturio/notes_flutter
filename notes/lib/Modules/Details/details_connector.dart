import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notes/Core/State/app_state.dart';
import 'package:notes/Model/note_model.dart';
import 'package:notes/Modules/Details/screen.dart';

class DetailsConnector extends StatelessWidget {
  final Note note;

  const DetailsConnector({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, DetailsProps>(
      distinct: true,
      converter: (store) => DetailsProps(
          note: note,
          create: (title, subtitle) {},
          back: Navigator.of(context).pop,
          isDownloading: false),
      builder: (context, props) => DetailsScreen(props: props));
}
