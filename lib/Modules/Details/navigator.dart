import 'package:notes/Misc/navigator.dart';

class DetailsNavigator extends BaseNavigator {
  Future<bool> navigateBack() {
    return state.maybePop();
  }
}
