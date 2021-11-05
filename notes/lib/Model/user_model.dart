// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String jwt;
  final String name;

  const User({required this.id, required this.jwt, this.name = ''});

  @override
  List<Object?> get props => [id];
}
