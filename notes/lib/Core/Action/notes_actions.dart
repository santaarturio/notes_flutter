import 'package:notes/Model/note_model.dart';

// MARK: - Reload
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
  final Exception error;

  DidFailReloadNotesAction({required this.error});
}

// MARK: - Create
// Trigger
class CreateNoteAction {
  final String title;
  final String subtitle;

  CreateNoteAction({required this.title, required this.subtitle});
}

// Progress
class CreatingNoteAction {}

// Did Reload
class DidCreateNoteAction {
  final Note note;

  DidCreateNoteAction({required this.note});
}

// Did Fail Reload
class DidFailCreateNoteAction {
  final Exception error;

  DidFailCreateNoteAction({required this.error});
}
