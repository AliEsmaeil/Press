import 'package:flutter/material.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/features/test_screen/view/dragging_game/dragging_game_widget.dart';
import 'package:press/features/test_screen/widgets/next_button.dart';
import 'package:press/features/test_screen/widgets/submit_test_screen.dart';
import 'package:press/models/dragging_game.dart';

class DraggingGamePageview extends StatefulWidget {
  final DraggingGameModel gameModel;

  DraggingGamePageview({super.key, required this.gameModel});

  @override
  State<DraggingGamePageview> createState() => _DraggingGamePageviewState();
}

class _DraggingGamePageviewState extends State<DraggingGamePageview> {
  PageController controller = PageController();

  int trackingIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(widget.gameModel.questions
        .map((question) => DraggingGameWidget(question: question))
        .toList() );
    widgets.add(SubmitTestScreen());

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: PageView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            onPageChanged: (index) {

              trackingIndex = index;
              print('tracking index: $trackingIndex');
              print('widgets length : ${widgets.length}');
              },
            children: widgets,
          ),
        ),
        if (trackingIndex < widgets.length -1 )
          Positioned(
            right: 30,
            bottom: 30,
            child: NextButton(
                onPressed: (){
                  setState((){
                    trackingIndex++;
                  });
                  controller.animateToPage(trackingIndex,
                      duration: Duration(seconds: 1), curve: Curves.easeInOut);
                }),
          )
      ],
    );
  }
}
