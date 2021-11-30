import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/Factory/factory.dart';

class BaseNavigator {
  final ScreenFactory factory = GetIt.instance<ScreenFactory>();
  NavigatorState get state => AppNavigator.globalKey.currentState!;

  Route<T> buildRoute<T>({
    required RouteBundle destination,
    required Widget child,
  }) {
    switch (destination.containerType) {
      case ContainerType.scaffold:
        return MaterialPageRoute(
          builder: (BuildContext context) => child,
          settings: RouteSettings(name: destination.name),
        );
    }
  }
}

extension AppNavigator on BaseNavigator {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
}

enum ContainerType { scaffold }

class RouteBundle {
  final String name;
  final ContainerType containerType;

  RouteBundle({
    required this.name,
    required this.containerType,
  });
}
