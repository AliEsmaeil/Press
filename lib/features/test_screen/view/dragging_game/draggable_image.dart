import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/reusable_widgets/image_from_asset.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

class DraggableImage extends StatefulWidget {
  final String imageName;

  const DraggableImage({super.key, required this.imageName});

  @override
  State<DraggableImage> createState() => _DraggableImageState();
}

class _DraggableImageState extends State<DraggableImage> {
 bool dropped = false;
@override
  Widget build(BuildContext context) {
  double imageDimension = context.width / 3;
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        var cubit = TestCubit.getCubit(context);
        return Expanded(
          child: dropped? SizedBox.shrink():
            Draggable(

              onDragStarted: (){
                TestCubit.touchCount++;
              },
              onDragUpdate: (details){
                print('i will add angel of drag');
                cubit.onDragStart(position: details.globalPosition);
                cubit.addDragAngel(details.localPosition);
              },

              onDragEnd: (details) {
                print('swipe will added');
                cubit.onDragEnd(position: details.offset);
                cubit.addSwipeSpeed(details.velocity.pixelsPerSecond.distance);

              },

              feedback: dropped ? SizedBox.shrink() : GestureDetector(

                child: SizedBox.square(
                    dimension: imageDimension,
                    child: ImageFromAsset(imageName: widget.imageName)),
              ),
              childWhenDragging: SizedBox.shrink(),
              data: widget.imageName,
              onDragCompleted: (){
                if(mounted){
                setState(() {
                  dropped = true;
                });
                }
              },
              child:  dropped ?SizedBox() : SizedBox.square(
                  dimension: imageDimension,
                  child: ImageFromAsset(imageName: widget.imageName)),
            ),

        );
      },
    );
  }
}
