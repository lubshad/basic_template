import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme =>
      ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue))
          .copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
