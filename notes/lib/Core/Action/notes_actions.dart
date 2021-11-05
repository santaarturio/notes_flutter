import 'package:notes/Model/note_model.dart';

// Trigger
class ReloadNotesAction {}

// Progress
class ReloadingNotesAction {}

// Did Reload
class DidReloadNotesAction {
  final List<Note> notes;

  DidReloadNotesAction({required this.notes});
}

// Did Fail Reload
class DidFailReloadNotesAction {
  final Error error;

  DidFailReloadNotesAction({required this.error});
}
