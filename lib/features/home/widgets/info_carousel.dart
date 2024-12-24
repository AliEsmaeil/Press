import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/text_styles.dart';
import 'package:press/features/home/widgets/measurement_card.dart';
import 'package:press/models/average_model.dart';

class InfoCarousel extends StatelessWidget {
  final OverallAverageModel model;

  const InfoCarousel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: context.width / 2,
        child: CarouselSlider(
            items: [

              Card(
                color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey.shade200 , width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person , color: Colors.blue,),
                          2.horizontalSpacer,
                          UnderlineText(title: 'Number of Tests'),
                        ],
                      ),
                      10.verticalSpacer,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.numberOfTests.toString(),
                            style: TextStyles.textStyle20,
                          ),
                          2.horizontalSpacer,
                          Text(
                            'tests',
                            style: TextStyles.textStyle16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              MeasurementCard(
                  messuerment: 'Age',
                  unit: 'year',
                  value: model.avgAges.toString(),
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
              MeasurementCard(
                  messuerment: 'Exam Time',
                  unit: 'minute',
                  value: (model.avgConsumedExamTime.toDouble() / 60).toStringAsFixed(2),
                  icon: Icon(
                    Icons.timer_outlined,
                    color: Colors.blue,
                  )),

            ],
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )));
  }

}

