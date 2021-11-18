// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../Model/note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      json['id'] as String,
      json['title'] as String,
      json['subtitle'] as String,
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'date': instance.date.toIso8601String(),
    };
