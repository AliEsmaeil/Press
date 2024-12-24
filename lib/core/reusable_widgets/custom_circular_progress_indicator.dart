import 'package:flutter/material.dart';
import 'package:press/core/utils/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        strokeWidth: 4,
      )
    );
  }
}
