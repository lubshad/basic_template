
import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

void showErrorMessage(r) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Text(r.toString()),
    ));
  }

enum PopupOptions {
  edit,
  delete,
}

extension PopupOptionsExtension on PopupOptions {
  String get title {
    switch (this) {
      case PopupOptions.edit:
        return 'Edit';
      case PopupOptions.delete:
        return 'Delete';
      default:
        return '';
    }
  }
}