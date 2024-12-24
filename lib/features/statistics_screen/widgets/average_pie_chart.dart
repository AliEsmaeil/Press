import 'dart:math';

import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/models/average_model.dart';
import 'package:press/models/representational_value.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AveragePieChart extends StatelessWidget {
  final OverallAverageModel model;

  const AveragePieChart({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * 1.65,
      child: SfCircularChart(
        title: ChartTitle(text: 'Donut Average Chart',),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          backgroundColor: Colors.grey.shade100,
          position: LegendPosition.bottom,
        ),
        series: [
          DoughnutSeries(
            dataSource:
                RepresentationalValue.getListOfRepresentationValue(model: model),
            xValueMapper: (rep, _) => rep.category,
            yValueMapper: (rep, _) => rep.value,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
