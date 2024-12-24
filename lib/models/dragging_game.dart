import 'package:press/models/dragging_question_model.dart';

final class DraggingGameModel {
  final String type;
  final List<DraggingQuestionModel> questions;

  DraggingGameModel({required this.type, required this.questions});

  factory DraggingGameModel.fromJson(Map<String, dynamic> json) {
    return DraggingGameModel(
        type: json['type'],
        questions: (json['questions'] as List)
            .map((question) => DraggingQuestionModel.fromJson(question))
            .toList());
  }
}
