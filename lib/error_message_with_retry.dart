import 'package:basic_template/app_error.dart';
import 'package:flutter/material.dart';

class ErrorMessageWithRetry extends StatelessWidget {
  const ErrorMessageWithRetry({
    Key? key,
    required this.error,
    required this.retry,
  }) : super(key: key);

  final AppError error;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error.appErrorType.toString()),
          TextButton(
            child: const Text("Retry"),
            onPressed: retry,
          ),
        ],
      ),
    );
  }
}
