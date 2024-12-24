import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:press/core/internet_connectivity/internet_connectivity.dart';
import 'package:press/core/utils/app_paths.dart';
import 'package:press/features/home/data/firebase_streamer.dart';
import 'package:press/models/dragging_game.dart';
import 'package:press/models/test_model.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {

  int age;
  Stopwatch examTimer = Stopwatch();
  DraggingGameModel? gameModel;

  int examScore = 0;

  // add value whenever user start dragging
  List<double> angelOfDrag = [];
  // add value whenever user touches the screen
  static List<double> touchPressure = [];
  // increase 1 whenever user touches the screen
  static int touchCount = 0;
  // at end of the exam: touch frequency will be calculated as following : freq = touchCount / time.
  double touchFrequency = 0;
  // add value whenever user swipes the screen (note: dragging is some sort of swiping and vice versa)
  List<double> swipeSpeed = [];

  // add value whenever user has an interval between two touches
  List<double> timeBetweenTouches = [];

  // add value whenever user make two touches
  List<double> distanceBetweenTouches = [];

  TestCubit({required this.age})
      : super(TestInitial()) {
    prepareGame();
    examTimer.start();
    print('pressure until now : $touchPressure');
  }



  static TestCubit getCubit(BuildContext context) => BlocProvider.of(context);

  // distance tracking variables
  Offset? initialPressPixel = Offset(0,0);
  Offset? lastPressPixel;
  // touch time counter
  Stopwatch touchStopwatch = Stopwatch();

  void onDragStart({required Offset position}){
    if(initialPressPixel != null){
      return;
    }
    touchStopwatch.start();
    initialPressPixel = position;
  }
  void onDragEnd({required Offset position}){
    touchStopwatch.stop();
    lastPressPixel = position;
    double distance = sqrt(
        pow(lastPressPixel!.dx - initialPressPixel!.dx, 2) +
            pow(lastPressPixel!.dy - initialPressPixel!.dy, 2));
    addDistanceBetweenTouches(distance);
    addTimeBetweenTouches(touchStopwatch.elapsed);
    initialPressPixel = null;
  }

  void addTimeBetweenTouches(Duration duration) {
    timeBetweenTouches.add(duration.inSeconds.toDouble());
  }

  void addDistanceBetweenTouches(double pixels) {
    distanceBetweenTouches.add(pixels);
  }

  // TODO: COMPLETED
  // will be accessed through the static variable from outside
  void addTouchPressure(double pressure) {
    touchPressure.add(pressure);
  }

  void addSwipeSpeed(double pixels) {
    swipeSpeed.add(pixels);
  }

  void increaseExamScore() => examScore++;

  // six adders, and seventh will be generated
  void addDragAngel(Offset position) {
    double dx = position.dx;
    double dy = position.dy;

    double angleInRadians = atan2(dy, dx);

    double angleInDegrees = angleInRadians * (180 / pi);
    angelOfDrag.add(angleInDegrees);
  }

  void prepareGame() async {
    emit(TestLoadingState());
    String stringJson = await rootBundle.loadString(
        '${AppPaths.jsonsPath}main.json');
    gameModel = DraggingGameModel.fromJson(jsonDecode(stringJson));
    emit(TestGotDataState());
  }

  void uploadResultsAndGoHome() async {
    examTimer.stop();
    if(! await InternetConnectivityChecker.isConnected()){
      emit(TestNotConnectedState());
      return;
    }
    var resultModel = TestModel(age: age,
        consumedExamTime: examTimer.elapsed.inSeconds,
        avgAngelOfDrag: getAverage(angelOfDrag),
        avgTouchPressure: getAverage(touchPressure),
        avgTouchCount:touchCount,
        avgTouchFrequency: touchCount / examTimer.elapsed.inSeconds,
        avgSwipeSpeed: getAverage(swipeSpeed),
        avgTimeBetweenTouches: getAverage(timeBetweenTouches),
        avgDistanceBetweenTouches: getAverage(distanceBetweenTouches));

    print('exam time :${resultModel.consumedExamTime} ');
    print('touch count :${resultModel.avgTouchCount} ');
    print('touch pressure :${resultModel.avgTouchPressure} ');
    print('distance between touches :${resultModel.avgDistanceBetweenTouches} ');
    print('time between touches :${resultModel.avgTimeBetweenTouches} ');
    print('angel of drag :${resultModel.avgAngelOfDrag} ');
    print('swipe speed :${resultModel.avgSwipeSpeed} ');
    print('touch frequency :${resultModel.avgTouchFrequency} ');
    print('age :${resultModel.age} ');

    FirebaseStreamer.uploadTest(test:resultModel );

    emit(TestCompletedState());
  }

  double getAverage(List<num> values) {
    print('comming to calc avg : $values');
    if(values.isEmpty)
      {
        return 0.0;
      }
    num sum = 0;
    for (var value in values) {
      if(value.isNaN){
        continue;
      }
      sum += value;
    }
    print('average is ${sum / values.length}');
    return sum / values.length;

  }

  @override
  Future<void> close() async {
    touchPressure = [];
    touchCount = 0;
    super.close();
  }
}
