
import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

void showErrorMessage(r) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Text(r.toString()),
    ));
  }