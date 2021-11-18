// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '../Misc/Generated/note.g.dart';

@JsonSerializable()
class Note extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final DateTime date;

  const Note(this.id, this.title, this.subtitle, this.date);

  @override
  List<Object?> get props => [id];

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
