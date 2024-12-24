import 'package:flutter/material.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType? inputType;
  final TextInputAction inputAction;
  final void Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData prefixIcon;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
        required this.controller,
      required this.hint,
      required this.inputAction,
      this.inputType,
      this.onSubmitted,
      this.validator,
      required this.prefixIcon,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      cursorColor: AppColors.primaryColor,
      keyboardType: inputType,
      validator: validator,
      textInputAction: inputAction,
      onFieldSubmitted: onSubmitted,
      style: TextStyles.textStyle14,
      obscureText: isPassword,
      autofocus: true,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.primaryColor)),
        hintStyle: TextStyles.textStyle14.copyWith(color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppVisualProperties.kPadding),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.primaryColor)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.errorColor)),
        prefixIconColor: Colors.grey,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
