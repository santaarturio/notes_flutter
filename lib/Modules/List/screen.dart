import 'package:flutter/material.dart';
import 'package:notes/Model/note.dart';

class NotesProps {
  final List<Note> notes;
  final bool isDownloading;
  final void Function() logout;
  final void Function(Note) details;
  final void Function() create;

  NotesProps(
      {required this.notes,
      required this.isDownloading,
      required this.details,
      required this.create,
      required this.logout});
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
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Notes', style: TextStyle(fontSize: 18)),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            leading: _logoutButton(),
            actions: [_createButton()]),
        body: widget.props.isDownloading ? _progressView() : _listView());
  }

  _logoutButton() {
    return GestureDetector(
        onTap: () => widget.props.logout(),
        child: const Icon(Icons.logout, size: 26.0));
  }

  _createButton() {
    return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
            onTap: widget.props.create,
            child: const Icon(Icons.create, size: 26.0)));
  }

  _progressView() {
    return const Center(child: CircularProgressIndicator());
  }

  _listView() {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 8, bottom: 48),
        itemCount: widget.props.notes.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(indent: 8),
        itemBuilder: (BuildContext context, int index) {
          final note = widget.props.notes[index];

          return GestureDetector(
            onTap: () => widget.props.details(note),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      note.subtitle,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
