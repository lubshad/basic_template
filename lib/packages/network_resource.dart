
import 'package:basic_template/packages/app_error.dart';
import 'package:basic_template/packages/default_loading_widget.dart';
import 'package:flutter/material.dart';

import 'error_message_with_retry.dart';

class NetworkResource extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;
  final AppError? error;
  final VoidCallback retry;
  final bool isLoading;

  const NetworkResource(
      {Key? key,
      required this.child,
      this.loadingWidget = const DefaultLoadingWidget(),
      required this.error,
      required this.retry,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return ErrorMessageWithRetry(error: error!, retry: retry);
    }
    if (isLoading) {
      return loadingWidget!;
    }
    return child;
  }
}
