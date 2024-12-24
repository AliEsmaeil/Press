import 'package:press/models/average_model.dart';

final class RepresentationalValue {
  final String category;
  final double value;

  RepresentationalValue({required this.category, required this.value});

  static List<RepresentationalValue> getListOfRepresentationValue(
      {required OverallAverageModel model}) {
    return [
      RepresentationalValue(
          category: 'Touch Count', value: model.avgTouchCount),
      RepresentationalValue(
          category: 'Touch Pressure', value: model.avgTouchPressure),
      RepresentationalValue(
          category: 'Touch Frequency', value: model.avgTouchFrequency),
      RepresentationalValue(
          category: 'Drag Angel', value: model.avgAngelOfDrag),
      RepresentationalValue(
          category: 'Touch Distance', value: model.avgDistanceBetweenTouches),
      RepresentationalValue(
          category: 'Time Between Touches', value: model.avgTimeBetweenTouches),
      RepresentationalValue(
          category: 'Swipe Speed', value: model.avgSwipeSpeed),
    ];
  }
}
