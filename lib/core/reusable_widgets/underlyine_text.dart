import 'package:flutter/material.dart';
import 'package:press/core/utils/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  const UnderlineText({super.key, required this.title, this.fontSize = 22, this.fontWeight= FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.clip,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          decorationThickness: 3,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decorationStyle: TextDecorationStyle.wavy,
          decorationColor: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          color: Colors.transparent,
          shadows: [
            Shadow(
              offset: Offset(0,-7),
            ),
          ]
      ),
    );
  }
}