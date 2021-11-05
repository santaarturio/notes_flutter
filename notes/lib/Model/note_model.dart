// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String subtitle;

  const Note(this.id, this.title, this.subtitle);

  @override
  List<Object?> get props => [id];
}
