import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/adaptive_dialog.dart';
import 'package:press/core/reusable_widgets/custom_outlined_button.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/features/home/widgets/age_dialog.dart';
import 'package:press/features/home/widgets/auth_dialog.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

import '../managers/home-manager/home_cubit.dart';

class MainData extends StatelessWidget {
  const MainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnderlineText(title: 'Take the test',),
        10.verticalSpacer,
        CustomOutlinedButton(child: Text('Go Test'), onPressed: ()=>showAgeDialog(context)),
        20.verticalSpacer,
        UnderlineText(title: 'Explore Results',),
        5.verticalSpacer,
        Text('Firstly, you will identify your identity as the owner of the app'),
        CustomOutlinedButton(child: Text('Results'), onPressed: ()=>BlocProvider.of<HomeCubit>(context).showAuthDiag(context)),
        20.verticalSpacer,

        UnderlineText(title: 'How the test works',),
        10.verticalSpacer,
        Text('you will find four question of the same type, each of which is a dragging question. in which you are required to drag some picture to the matching corresponding one shaded in black. after completing the exam you will be able to submit your results. ')
        ,10.verticalSpacer,
      ],
    );
  }
}
