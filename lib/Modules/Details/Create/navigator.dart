import 'package:notes/Misc/navigator.dart';

class CreateNoteNavigator extends BaseNavigator {
  Future<bool> navigateBack() {
    return state.maybePop();
  }
}
