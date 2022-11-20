// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

import 'logger.dart';

getArguments(RouteSettings settings) {
  var arguments;

  final args = settings.arguments;

  if (args != null) {
    arguments = args;
    logInfo(arguments);
  } else {
    Uri settingsUri = Uri.parse(settings.name!);
    if (settingsUri.hasQuery) {
      Map<String, dynamic> queryParams = {};
      settingsUri.queryParameters.forEach((key, value) {
        var queryValue = int.tryParse(value) ?? value;
        queryParams[key] = queryValue;
      });
      logInfo(queryParams);
      arguments = queryParams;
    }
  }
  return arguments;
}

getRouteName(RouteSettings settings) {
  String routeName = Uri.parse(settings.name!).path;
  logInfo(routeName);
  return routeName;
}
