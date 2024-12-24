import 'package:flutter/material.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/custom_outlined_button.dart';
import 'package:press/core/reusable_widgets/image_from_asset.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/core/utils/text_styles.dart';
import 'package:press/features/home/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          100.verticalSpacer,
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ImageFromAsset(
              imageName: 'app-icon.png',
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(AppVisualProperties.kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UnderlineText(title: 'Science Growth', fontSize: 25, fontWeight: FontWeight.w500,),
                  10.verticalSpacer,
                  Text('Take immediate gesture test and explore results', textAlign: TextAlign.center,style: TextStyles.textStyle16,),
                  25.verticalSpacer,
                  CustomOutlinedButton(child: Text('Let\'s go'), onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false,);
                  })
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
