import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/custom_outlined_button.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/text_styles.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

class SubmitTestScreen extends StatelessWidget {
  const SubmitTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        var cubit = TestCubit.getCubit(context);

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.done, size: 100, color: AppColors.primaryColor,),
            5.verticalSpacer,
            Text('Yahhooo!', style: TextStyles.textStyle24,),
            20.verticalSpacer,
            Text('You got : ${cubit.examScore} correct answer.'),
            GestureDetector(
              onForcePressStart: (details){
                TestCubit.touchPressure.add(details.pressure);
              },
              onForcePressEnd: (details){
                TestCubit.touchPressure.add(details.pressure);
              },
              onForcePressUpdate: (details){
                TestCubit.touchPressure.add(details.pressure);
              },
              onForcePressPeak: (details){
                TestCubit.touchPressure.add(details.pressure);
              },
              child: CustomOutlinedButton(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_done, color: AppColors.primaryColor,),
                  4.horizontalSpacer,
                  Text('Upload results'),
                ],
              ), onPressed: ()=>cubit.uploadResultsAndGoHome()),
            ),
          ],
        );
      },
    );
  }
}
