// ignore_for_file: prefer_function_declarations_over_variables

import 'package:get_it/get_it.dart';
import 'package:notes/Service/login_api.dart';
import 'package:dio/dio.dart';
import 'package:notes/Service/notes_api.dart';

abstract class Assembler {
  static final registerDependencies = () {
    final registrar = GetIt.instance;

    // Service
    final dio = Dio();
    registrar.registerLazySingleton(() => LoginAPI(dio));
    registrar.registerLazySingleton(() => NotesAPI(dio));
  };
}
