import 'package:flutter/material.dart';
import 'package:press/core/utils/text_styles.dart';

void showCustomSnack(
    {required BuildContext context,
    required String message,
      SnackBarAction? actionButton,
    required Color color}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyles.textStyle14.copyWith(
          color: Colors.white,
        ),
      ),
      action: actionButton,
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      elevation: 2,
      duration: Duration(seconds: 4),
      padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 12),
    ),
    snackBarAnimationStyle: AnimationStyle(
      curve: Curves.easeInOut,
      duration: Duration(seconds: 1),
    ),
  );
}
