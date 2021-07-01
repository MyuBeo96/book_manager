import 'package:flutter/material.dart';

import 'widgets.dart';

class AppPrompt {
  static showAlertDialog(
    BuildContext context, {
    String? title,
    String? descriptions,
    String textButton = 'Đồng ý',
    String negativeButtonText = 'Không',
    Function? confirm,
    Function? cancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: DialogBase(
            title: title!,
            descriptions: descriptions!,
            onButton1: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
