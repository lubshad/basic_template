// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

import 'logger.dart';

getArguments(RouteSettings settings) {
  var arguments;

  final args = settings.arguments;

  if (args != null) {
    arguments = args;
  } else {
    Uri settingsUri = Uri.parse(settings.name!);
    if (settingsUri.hasQuery) {
      arguments = "${settingsUri.queryParameters}";
    }
  }
  logger.info(arguments);
  return arguments;
}

getRouteName(RouteSettings settings) {
  String routeName = Uri.parse(settings.name!).path;
  logger.info(routeName);
  return routeName;
}
