import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/reusable_widgets/adaptive_dialog.dart';
import 'package:press/core/reusable_widgets/custom_text_button.dart';
import 'package:press/core/reusable_widgets/custom_text_field.dart';
import 'package:press/core/validators/text_field_validator.dart';
import 'package:press/features/home/managers/home-manager/home_cubit.dart';

void showAuthDialog(BuildContext context) {
  TextEditingController controller = TextEditingController();
  showDiag(
      context: context,
      title: 'Authentication',
      textField: CustomTextField(
        controller: controller,
          hint: 'Password',
          inputAction: TextInputAction.go,
          prefixIcon: Icons.password,
          isPassword: true,
        validator: TextFieldValidator.passwordValidator,
        inputType: TextInputType.visiblePassword,
        onSubmitted: (s){
            BlocProvider.of<HomeCubit>(context).authUser(s);
        },
      ),
      okButton: CustomTextButton(onPressed: ()=>BlocProvider.of<HomeCubit>(context).authUser(controller.text), text: 'Ok'),
      cancelButton: CustomTextButton(onPressed: (){
        if(context.mounted){
          Navigator.of(context).pop();
        }
      }, text: 'Cancel'));
}
