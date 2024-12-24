import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/reusable_widgets/custom_circular_progress_indicator.dart';
import 'package:press/core/reusable_widgets/custom_outlined_button.dart';
import 'package:press/core/reusable_widgets/custom_snak_bar.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/features/home/widgets/measurement_card.dart';
import 'package:press/features/statistics_screen/managers/statistics_cubit.dart';
import 'package:press/features/statistics_screen/widgets/average_bar_chart.dart';
import 'package:press/features/statistics_screen/widgets/average_pie_chart.dart';
import 'package:press/models/average_model.dart';

class StatisticsScreenBody extends StatelessWidget {

  const StatisticsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<StatisticsCubit, StatisticsStates>(
        listener: (context, state) {
          var cubit = StatisticsCubit.getCubit(context);
          if (state is StatsPermissionDeniedState) {
            showCustomSnack(context: context,
                message: 'Give Storage Permission to export file!',
                color: Colors.black87);
          }
          else if (state is StatsSuccessExcelSaveState) {
            showCustomSnack(context: context,
                message: 'Excel File Successfully Generated, go to downloads',
                color: AppColors.primaryColor,
             );
            }
                else if (state is StatsPermissionDeniedState)
            {
              showCustomSnack(context: context,
                  message: 'Can\'t generate the excel file!',
                  color: AppColors.errorColor);
            }
          },
        builder: (context, state) {
          var cubit = StatisticsCubit.getCubit(context);
          if (cubit.avgModel == null || state is StatisticsLoadingState) {
            return CustomCircularProgressIndicator();
          }
          else {
            var model = cubit.avgModel!;
            return Padding(
              padding: EdgeInsets.all(AppVisualProperties.kPadding),
              child: Column(
                children: [
                  UnderlineText(title: 'Average'),
                  20.verticalSpacer,
                  SizedBox(
                    height: context.width / 2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        MeasurementCard(icon: Icon(Icons.ads_click),
                            messuerment: 'Touch Count',
                            value: model.avgTouchCount.toString(),
                            unit: '/ minute'),
                        MeasurementCard(icon: Icon(Icons.compress),
                            messuerment: 'Touch Pressure',
                            value: model.avgTouchPressure.toStringAsFixed(2),
                            unit: 'GOF'),
                        MeasurementCard(icon: Icon(Icons.swipe),
                            messuerment: 'Swipe Speed',
                            value: model.avgSwipeSpeed.toStringAsFixed(2),
                            unit: 'pixel / second'),
                        MeasurementCard(
                            icon: Icon(Icons.social_distance_outlined),
                            messuerment: 'Touches Distance',
                            value: model.avgDistanceBetweenTouches
                                .toStringAsFixed(2),
                            unit: 'pixels'),
                        MeasurementCard(icon: Icon(Icons.speed),
                            messuerment: 'Touch Frequency',
                            value: model.avgTouchFrequency.toStringAsFixed(2),
                            unit: 'touch / second'),
                        MeasurementCard(icon: Icon(Icons.timeline_rounded),
                            messuerment: 'Time Between Touches',
                            value: model.avgTimeBetweenTouches.toStringAsFixed(
                                2),
                            unit: 'second'),
                        MeasurementCard(icon: Icon(Icons.drag_handle),
                            messuerment: 'Drag Angel',
                            value: model.avgAngelOfDrag.toStringAsFixed(2),
                            unit: '°'),

                      ],
                    ),
                  ),
                  20.verticalSpacer,
                  AverageBarChart(model: model),
                  10.verticalSpacer,
                  AveragePieChart(model: model),
                  2.verticalSpacer,
                  CustomOutlinedButton(child: Text('Export Excel'),
                      onPressed: () => cubit.exportExcel()),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
