import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:excel/excel.dart';
import 'package:press/core/utils/app_keys.dart';
import 'package:press/models/average_model.dart';
import 'package:press/models/test_model.dart';

final class FirebaseStreamer {
  static FirebaseFirestore? _db;

  static void uploadTest({required TestModel test}) async {
    _db ??= FirebaseFirestore.instance;
    await _db?.collection(AppKeys.resultsCollection).add(test.toJson());
  }

  static Future<OverallAverageModel?> getOverallAverage() async {
    _db ??= FirebaseFirestore.instance;
    var snapshot = await _db?.collection(AppKeys.resultsCollection).get();
    List<TestModel>? tests =
    snapshot?.docs.map((doc) => TestModel.fromJson(doc.data())).toList();
    if (tests == null) {
      return null;
    }
    double sumAngelOfDrag = 0;
    double sumTouchPressure = 0;
    double sumTouchCount = 0;
    double sumTouchFrequency = 0;
    double sumSwipeSpeed = 0;
    double sumTimeBetweenTouches = 0;
    double sumDistanceBetweenTouches = 0;
    int sumConsumedExamTime = 0;
    int sumAges = 0;

    for (var test in tests) {
      sumAngelOfDrag += test.avgAngelOfDrag;
      sumTouchPressure += test.avgTouchPressure;
      sumTouchCount += test.avgTouchCount;
      sumTouchFrequency += test.avgTouchFrequency;
      sumSwipeSpeed += test.avgSwipeSpeed;
      sumTimeBetweenTouches += test.avgTimeBetweenTouches;
      sumDistanceBetweenTouches += test.avgDistanceBetweenTouches;
      sumConsumedExamTime += test.consumedExamTime;
      sumAges += test.age;
    }

    var l = tests.length;
    print('called, and length of tests: $l ');
    return OverallAverageModel(
        l,
        sumConsumedExamTime ~/ l,
        sumAges ~/ l,
        sumAngelOfDrag / l,
        sumTouchPressure / l,
        sumTouchCount / l,
        sumTouchFrequency / l,
        sumSwipeSpeed / l,
        sumTimeBetweenTouches / l,
        sumDistanceBetweenTouches / l);
  }

  static Future<List<TestModel>> getAllTests() async {
    _db ??= FirebaseFirestore.instance;
    var snapshot = await _db?.collection(AppKeys.resultsCollection).get();
    List<TestModel>? tests =
    snapshot?.docs.map((doc) => TestModel.fromJson(doc.data())).toList();
    if (tests == null) {
      return [];
    }
    return tests;
  }

  static Future<String> storedPassword() async {
    _db ??= FirebaseFirestore.instance;
    var snapshot = await _db?.collection(AppKeys.passCollection).get();
    return snapshot?.docs.first.data()['pass'];
  }

  static Future<bool> prepareExcelSheetAndSave() async {
    try {
      var downloadDir = await getDownloadDirectory();
      var path = downloadDir.path;
      String fileName = 'gesturesStatistics.xlsx';

      var excel = Excel.createExcel(); // Create a new Excel file
      Sheet sheet = excel['Sheet1']; // Create a new sheet

      sheet.insertRowIterables([
        TextCellValue('Angel of drag', ),
        TextCellValue('Touch pressure'),
        TextCellValue('Touch count'),
        TextCellValue('Touch frequency'),
        TextCellValue('Swipe speed'),
        TextCellValue('Time between touches'),
        TextCellValue('Distance between touches')
      ], 0);

      List<TestModel> tests = await getAllTests();
      for (int i = 0; i < tests.length; i++) {
        sheet.insertRowIterables([
          TextCellValue(tests[i].avgAngelOfDrag.toString()),
          TextCellValue(tests[i].avgTouchPressure.toString()),
          TextCellValue(tests[i].avgTouchCount.toString()),
          TextCellValue(tests[i].avgTouchFrequency.toString()),
          TextCellValue(tests[i].avgSwipeSpeed.toString()),
          TextCellValue(tests[i].avgTimeBetweenTouches.toString()),
          TextCellValue(tests[i].avgDistanceBetweenTouches.toString()),
        ], i + 1);
      }
      File excelFile = File('$path/$fileName');
      await excelFile.writeAsBytes(excel.encode()!);
      return true;
    }
    catch (e) {
      return false;
    }
  }
}
