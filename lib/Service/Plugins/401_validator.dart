// ignore_for_file: file_names

import 'package:notes/Core/Action/login_actions.dart';
import 'package:notes/Core/Store/app_store.dart';

abstract class Validator {}

extension Validator401 on Validator {
  static bool validate(int? statusCode) {
    if (statusCode == 401) {
      store.dispatch(LogOutAction());
    }

    return statusCode != 401;
  }
}
