// ignore_for_file: avoid_print


// Blue text
void logInfo(msg) {
  print('\x1B[34m$msg\x1B[0m');
}

// Green text
void logSuccess(msg) {
  print(
    '\x1B[32m$msg\x1B[0m',
  );
}

// Yellow text
void logWarning(msg) {
  print('\x1B[33m$msg\x1B[0m');
}

// Red text
void logError(msg) {
  print('\x1B[31m$msg\x1B[0m');
}
