import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDiag(
    {required BuildContext context,
    required Widget textField,
    required okButton,
    required Widget cancelButton,
    required String title,
    }) {
  showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(title),
          shadowColor: Colors.grey,
          actions: [
            cancelButton,
            okButton,
          ],
          content: textField,
          actionsAlignment: MainAxisAlignment.spaceAround,
        );
      });
}
