import 'package:flutter/material.dart';
import 'package:notes/Model/note.dart';

class NotesProps {
  final List<Note> notes;
  final bool isDownloading;
  final void Function() logout;
  final void Function(Note) details;
  final void Function() create;

  NotesProps({
    required this.notes,
    required this.isDownloading,
    required this.details,
    required this.create,
    required this.logout,
  });
}

class NotesScreen extends StatefulWidget {
  final NotesProps props;

  const NotesScreen({Key? key, required this.props}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Notes'),
          centerTitle: true,
          leading: IconButton(
            onPressed: widget.props.logout,
            icon: const Icon(Icons.logout, size: 26.0),
          ),
          actions: [
            IconButton(
              onPressed: widget.props.create,
              icon: const Icon(Icons.create, size: 26.0),
            )
          ]),
      body: widget.props.isDownloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 8, bottom: 48),
              itemCount: widget.props.notes.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 8),
              itemBuilder: (BuildContext context, int index) {
                final note = widget.props.notes[index];

                return ListTile(
                    onTap: () => widget.props.details(note),
                    title: Text(
                      note.title,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      note.subtitle,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline2,
                    ));
              }),
    );
  }
}
