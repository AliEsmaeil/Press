import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/core/utils/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomOutlinedButton(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        surfaceTintColor: WidgetStatePropertyAll(AppColors.primaryColor),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle:WidgetStatePropertyAll( TextStyles.textStyle18),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 35.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.grey.shade300, width: 1)),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        padding: WidgetStatePropertyAll(EdgeInsets.all(AppVisualProperties.kPadding))
      ),
      child: child,
    );
  }
}
