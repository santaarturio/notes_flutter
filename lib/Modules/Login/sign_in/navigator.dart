import 'package:notes/Misc/navigator.dart';

class SignInNavigator extends BaseNavigator {
  Future<T?> navigateToSignUp<T>() {
    return state.push<T>(buildRoute(
      destination: RouteBundle(
        name: "/sign_up",
        containerType: ContainerType.scaffold,
      ),
      child: factory.makeSignUpScreen(),
    ));
  }
}
