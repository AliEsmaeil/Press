final class DraggingQuestionModel{
  final int id;
  final List<String> images;

  DraggingQuestionModel({required this.id, required this.images});

  factory DraggingQuestionModel.fromJson(Map<String,dynamic> json){
    return DraggingQuestionModel(
      id: json['id'],
      images :List<String>.from(json['images']),
    );
  }

  Map<String,dynamic> get toJson{
    return {
      "id": id,
      "images" : images,
    };
  }
}