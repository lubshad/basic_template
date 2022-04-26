import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  Screens currentScreen = Screens.dashboard;

  changeCurrentScreen(Screens screen) {
    currentScreen = screen;
    notifyListeners();
  }
}

enum Screens {
  dashboard,
  profile,
  settings,
}

extension ScreenExtension on Screens {
  Widget get icon {
    switch (this) {
      case Screens.dashboard:
        return const Icon(CupertinoIcons.home);
      case Screens.profile:
        return const Icon(CupertinoIcons.profile_circled);
      case Screens.settings:
        return const Icon(CupertinoIcons.settings);
    }
  }

  String get label {
    switch (this) {
      case Screens.dashboard:
        return 'Dashboard';
      case Screens.profile:
        return 'Profile';
      case Screens.settings:
        return 'Settings';
    }
  }

  Widget get body {
    switch (this) {
      case Screens.dashboard:
        return const Center(
          child: Text('Dashboard'),
        );
      case Screens.profile:
        return const Center(
          child: Text('Profile'),
        );
      case Screens.settings:
        return const Center(
          child: Text('Settings'),
        );
    }
  }
}
