import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import 'screens/home/home.dart';


class AppRoute {
  // Routes
  static const String initial = '/';

  // onGenerateRoute
  static Route onGenerateRoute(RouteSettings settings) {
    final routeName = getRouteName(settings);
    // final arguments = getArguments(settings);
    switch (routeName) {
      case initial:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }

  static List<Route> onGenerateInitialRoute(String initialRoute) {
    return [
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    ];
  }
}
