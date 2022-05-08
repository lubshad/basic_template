import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import '/utils/constants.dart';
import '/utils/extensions.dart';

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
          LayoutBuilder(
            builder: (context, constraints) {
              return SvgPicture.asset(
                error.appErrorType.svgImage,
                width: constraints.maxWidth * .7,
                fit: BoxFit.cover,
              );
            },
          ),
          defaultSpacer,
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
