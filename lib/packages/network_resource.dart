import 'package:basic_template/packages/app_error.dart';
import 'package:flutter/material.dart';

class NetworkResource extends StatelessWidget {
  final Widget child;
  final Widget loadingWidget;
  final Widget errorWidget;
  final AppError? error;
  final bool isLoading;

  const NetworkResource(
      {super.key,
      required this.child,
      this.loadingWidget = const Center(child: CircularProgressIndicator()),
      required this.error,
      required this.isLoading,
      this.errorWidget = const Center(
        child: Text("Unexpected Error"),
      )});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Builder(builder: (context) {
        if (error != null) {
          return errorWidget;
        } else if (isLoading) {
          return loadingWidget;
        } else {
          return child;
        }
      }),
    );
  }
}
