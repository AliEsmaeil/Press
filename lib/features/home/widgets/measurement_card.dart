import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/text_styles.dart';

class MeasurementCard extends StatelessWidget {
  final String messuerment;
  final String value;
  final String unit;
  final Icon icon;
  const MeasurementCard({super.key,required this.icon, required this.messuerment, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: context.width * 4.5 /5  ,
      child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey.shade200 , width: 1)),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    2.horizontalSpacer,
                    UnderlineText(title: 'Average $messuerment', fontSize: 18, ),
                  ],
                ),
                10.verticalSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toString(),
                      style: TextStyles.textStyle20,
                    ),
                    2.horizontalSpacer,
                    Text(
                      unit,
                      style: TextStyles.textStyle16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
