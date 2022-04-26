import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import '../home_controller.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return AnimatedBuilder(
        animation: homeController,
        builder: (context, child) {
          return Drawer(
            child: Column(
              children: [
                const DrawerHeader(child: Center(child: Text("App Name"))),
                ...Screens.values
                    .map((e) => ListTile(
                          selected: homeController.currentScreen == e,
                          title: Text(e.label),
                          leading: e.icon,
                          onTap: () => homeController.changeCurrentScreen(e),
                        ))
                    .toList()
              ],
            ),
          );
        });
  }
}
