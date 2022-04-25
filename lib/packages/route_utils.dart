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
  if (arguments != null) {
    logger.info(arguments);
  }
  return arguments;
}

getRouteName(RouteSettings settings) {
  var routingData;

  if (settings.name != null) {
    routingData = settings.name!;
  }
  final args = settings.arguments;

  if (args == null) {
    Uri settingsUri = Uri.parse(settings.name!);
    if (settingsUri.pathSegments.length > 1) {
      routingData =
          "/" + settingsUri.pathSegments[settingsUri.pathSegments.length - 1];
    }
  }
  logger.info(routingData);
  return routingData;
}
