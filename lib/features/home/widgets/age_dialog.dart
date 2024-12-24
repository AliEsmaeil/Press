import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/reusable_widgets/adaptive_dialog.dart';
import 'package:press/core/reusable_widgets/custom_text_button.dart';
import 'package:press/core/reusable_widgets/custom_text_field.dart';
import 'package:press/core/validators/text_field_validator.dart';
import 'package:press/features/home/managers/home-manager/home_cubit.dart';

void showAgeDialog(BuildContext context) {
  TextEditingController controller = TextEditingController();
  showDiag(
      context: context,
      title: 'Age Verification',
      textField: CustomTextField(
        controller: controller,
        hint: 'Age',
        inputAction: TextInputAction.go,
        prefixIcon: Icons.boy,
        isPassword: false,
        validator: TextFieldValidator.ageValidation,
        inputType: TextInputType.number,
        onSubmitted: (s){
          BlocProvider.of<HomeCubit>(context).goTest(s);
        },
      ),
      okButton: CustomTextButton(onPressed: () =>BlocProvider.of<HomeCubit>(context).goTest(controller.text), text: 'Ok'),
      cancelButton: CustomTextButton(onPressed: (){
        if(context.mounted){
          Navigator.of(context).pop();
        }
      }, text: 'Cancel'));
}
