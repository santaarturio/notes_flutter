import 'package:flutter/material.dart';
import 'package:notes/Model/note.dart';
import 'package:notes/Modules/Details/Create/connector.dart';
import 'package:notes/Modules/Details/connector.dart';
import 'package:notes/Modules/List/connector.dart';
import 'package:notes/Modules/Login/sign_in/connector.dart';
import 'package:notes/Modules/Login/sign_up/connector.dart';

class ScreenFactory {
  Widget makeSignInScreen() {
    return SignInConnector();
  }

  Widget makeSignUpScreen() {
    return SignUpConnector();
  }

  Widget makeNotesScreen() {
    return NotesConnector();
  }

  Widget makeCreateNoteScreen() {
    return CreateNoteConnector();
  }

  Widget makeDetailscreen({required Note note}) {
    return DetailsConnector(note: note);
  }
}
