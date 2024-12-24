final class OverallAverageModel{
  final double avgAngelOfDrag;
  final double avgTouchPressure;
  final double avgTouchCount;
  final double avgTouchFrequency;
  final double avgSwipeSpeed;
  final double avgTimeBetweenTouches;
  final double avgDistanceBetweenTouches;

  final int numberOfTests;
  final int avgConsumedExamTime;
  final int avgAges;

  OverallAverageModel(
      this.numberOfTests,
      this.avgConsumedExamTime,
      this.avgAges,
      this.avgAngelOfDrag,
      this.avgTouchPressure,
      this.avgTouchCount,
      this.avgTouchFrequency,
      this.avgSwipeSpeed,
      this.avgTimeBetweenTouches,
      this.avgDistanceBetweenTouches);
}