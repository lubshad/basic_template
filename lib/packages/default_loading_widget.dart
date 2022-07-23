import 'package:flutter/material.dart';

class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({Key? key , this.color = Colors.blue}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}



class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }
}
