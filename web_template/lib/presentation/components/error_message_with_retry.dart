import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:web_template/utils/extensions.dart';

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
          SvgPicture.asset(
            error.appErrorType.svgImage,
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
          Text(error.appErrorType.toString()),
          TextButton(
            onPressed: retry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
