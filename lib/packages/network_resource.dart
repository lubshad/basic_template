import 'package:basic_template/packages/app_error.dart';
import 'package:flutter/material.dart';

class NetworkResource extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final AppError? error;
  final bool isLoading;

  const NetworkResource(
      {Key? key,
      required this.child,
      this.loadingWidget = const CircularProgressIndicator(),
      required this.error,
      required this.isLoading,
      this.errorWidget = const Center(
        child: Text("Unexpected Error"),
      )})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (error != null) {
          errorWidget;
        }
        if (isLoading) {
          return loadingWidget!;
        }
        return child;
      }),
    );
  }
}
