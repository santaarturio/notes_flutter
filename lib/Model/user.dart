// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String jwt;
  final String email;
  final String? name;

  const User({required this.id, required this.jwt, required this.email, this.name});

  @override
  List<Object?> get props => [id];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
