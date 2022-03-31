import 'package:book_manager/shared/widget/widgets.dart';
import 'package:flutter/material.dart';

class AlertDialogApp {
  showAlert({
    required BuildContext context,
    required String title,
    required String description,
    GestureTapCallback? onTap,
  }) {
    showDialog(
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: title,
          description: description,
          onTap: onTap,
        );
      },
    );
  }
}
