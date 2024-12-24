final class TestModel{
  final int age;
  // time which student has completed the exam (in seconds)
  final int consumedExamTime;

  // meassurments
  final num avgAngelOfDrag;
  final num avgTouchPressure;
  final num avgTouchCount;
  final num avgTouchFrequency;
  final num avgSwipeSpeed;
  final num avgTimeBetweenTouches;
  final num avgDistanceBetweenTouches;

  TestModel({
      required this.age,
      required this.consumedExamTime,
      required this.avgAngelOfDrag,
      required this.avgTouchPressure,
      required this.avgTouchCount,
      required this.avgTouchFrequency,
      required this.avgSwipeSpeed,
      required this.avgTimeBetweenTouches,
      required this.avgDistanceBetweenTouches});

  factory TestModel.fromJson(Map<String,dynamic> json){
    return TestModel(
      age: json['age'],
      avgAngelOfDrag: json['avgAngelOfDrag'] ,
      avgDistanceBetweenTouches: json['avgDistanceBetweenTouches'],
      avgSwipeSpeed: json['avgSwipeSpeed'],
      avgTimeBetweenTouches: json['avgTimeBetweenTouches'],
      avgTouchCount: json['avgTouchCount'],
      avgTouchFrequency: json['avgTouchFrequency'],
      avgTouchPressure: json['avgTouchPressure'],
      consumedExamTime: json['consumedExamTime']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "avgAngelOfDrag" : avgAngelOfDrag,
      "avgDistanceBetweenTouches" : avgDistanceBetweenTouches,
      "avgSwipeSpeed" : avgSwipeSpeed,
      'avgTimeBetweenTouches' : avgTimeBetweenTouches,
      'avgTouchCount' : avgTouchCount,
      'avgTouchFrequency' : avgTouchFrequency,
      'avgTouchPressure' : avgTouchPressure,
      'consumedExamTime' : consumedExamTime,
      'age' : age,
    };
  }
}