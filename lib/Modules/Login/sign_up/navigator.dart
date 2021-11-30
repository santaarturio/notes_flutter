import 'package:notes/Misc/navigator.dart';

class SignUpNavigator extends BaseNavigator {
  Future<bool> navigateBack() {
    return state.maybePop();
  }
}
