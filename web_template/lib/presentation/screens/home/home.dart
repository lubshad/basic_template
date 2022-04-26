import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

import 'components/home_drawer.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    HomeController navigationController = Get.find();
    return AnimatedBuilder(
        animation: navigationController,
        builder: (context, child) {
          return Scaffold(
            body: Row(
              children: [
                const HomeDrawer(),
                Expanded(
                  child: navigationController.currentScreen.body,
                ),
              ],
            ),
          );
        });
  }
}

