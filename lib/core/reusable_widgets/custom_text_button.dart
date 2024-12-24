import 'package:flutter/material.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/core/utils/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.textStyle14.copyWith(
          color: Colors.lightBlue,
        ),
      ),
      style: ButtonStyle(
          padding: WidgetStatePropertyAll(
              EdgeInsets.all(AppVisualProperties.kPadding)),
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
         // minimumSize: WidgetStatePropertyAll(Size(double.infinity, 25)),
          overlayColor: WidgetStatePropertyAll(AppColors.primaryColor)),
    );
  }
}
