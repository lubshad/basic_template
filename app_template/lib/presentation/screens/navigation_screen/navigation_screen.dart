import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import 'navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationController());
    NavigationController navigationController = Get.find();
    return AnimatedBuilder(
        animation: navigationController,
        builder: (context, child) {
          return Scaffold(
            body: navigationController.currentScreen.body,
            bottomNavigationBar: BottomNavigationBar(
                items: Screens.values
                    .map((e) =>
                        BottomNavigationBarItem(icon: e.icon, label: e.label))
                    .toList(),
                onTap: (index) => navigationController
                    .changeCurrentScreen(Screens.values[index])),
          );
        });
  }
}
