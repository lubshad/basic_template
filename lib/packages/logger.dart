// ignore_for_file: avoid_print

// Blue text

import 'dart:convert';
import 'dart:developer';

void logInfo(msg) {
  String? jsonData;
  try {
    jsonData = jsonEncode(msg);
  } catch (e) {
    jsonData = msg.toString();
  }
  log('\x1B[34m$jsonData\x1B[0m');
}

// Green text
void logSuccess(msg) {
  String? jsonData;
  try {
    jsonData = jsonEncode(msg);
  } catch (e) {
    jsonData = msg.toString();
  }
  log(
    '\x1B[32m$jsonData\x1B[0m',
  );
}

// Yellow text
void logWarning(msg) {
  String? jsonData;
  try {
    jsonData = jsonEncode(msg);
  } catch (e) {
    jsonData = msg.toString();
  }
  log('\x1B[33m$jsonData\x1B[0m');
}

// Red text
void logError(msg) {
  String? jsonData;
  try {
    jsonData = jsonEncode(msg);
  } catch (e) {
    jsonData = msg.toString();
  }
  log('\x1B[31m$jsonData\x1B[0m');
}
