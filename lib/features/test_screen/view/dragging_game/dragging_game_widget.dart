import 'package:flutter/material.dart';
import 'package:press/core/reusable_widgets/underlyine_text.dart';
import 'package:press/features/test_screen/view/dragging_game/drag_target_image.dart';
import 'package:press/features/test_screen/view/dragging_game/draggable_image.dart';
import 'package:press/models/dragging_game.dart';
import 'package:press/models/dragging_question_model.dart';

class DraggingGameWidget extends StatelessWidget {
  final DraggingQuestionModel question;

  const DraggingGameWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    var darkImages = List.from(question.images);
    darkImages.shuffle();
    return Column(
      children: [

        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: question.images
                    .map((image) => DraggableImage(
                          imageName: image,
                        ))
                    .toList(),
              )),
              Expanded(
                child: SizedBox.shrink(),
              ),
              Expanded(
                  child: Column(
                children: darkImages
                    .map((image) => DragTargetImage(
                          imageName: getDarkImageName(image),
                        ))
                    .toList(),
              )),
            ],
          ),
        ),
      ],
    );
  }

  String getDarkImageName(String imageName) {
    String darkImageName = imageName.substring(0, imageName.length - 4);
    darkImageName += '-dark.png';
    return darkImageName;
  }
}
