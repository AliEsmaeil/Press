import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/models/average_model.dart';
import 'package:press/models/representational_value.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AverageBarChart extends StatelessWidget {
  final OverallAverageModel model;

  const AverageBarChart({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * 1.5,
      child: SfCartesianChart(
          title: ChartTitle(text: 'Bar Average Chart',),
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            backgroundColor: Colors.grey.shade100,
            position: LegendPosition.bottom,
          ),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series:RepresentationalValue.getListOfRepresentationValue(model: model).map((rep)=>BarSeries(
          dataSource: [rep],
          xValueMapper: (rep, _) => (rep ).category,
          yValueMapper: (rep, _) => (rep ).value,),).toList()),

    );
  }
}
