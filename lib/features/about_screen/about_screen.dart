import 'package:flutter/material.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/core/utils/text_styles.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'AboutScreen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About Press'),
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnderlineText(title: 'It\'s a Gesture Detector'),
            5.verticalSpacer,
            Text(
                'Press is a gesture detector app that measure and detect how many times you count the screen, how much pressure you put on the screen arriving to the speed of sipping and many more.',
            style: TextStyles.textStyle16,
            )
          ],
        ),
      ),
    );
  }
}
