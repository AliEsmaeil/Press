import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/extensions/context_extension.dart';
import 'package:press/core/reusable_widgets/dark_image_from_asset.dart';
import 'package:press/core/reusable_widgets/image_from_asset.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

class DragTargetImage extends StatefulWidget {
  final String imageName;

  const DragTargetImage({super.key, required this.imageName});

  @override
  State<DragTargetImage> createState() => _DragTargetImageState();
}

class _DragTargetImageState extends State<DragTargetImage> {
  bool gotTarget = false;
  String targetImageName = "";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        var cubit = TestCubit.getCubit(context);
        return Expanded(
          child: SizedBox.square(
            dimension: context.width/3,
            child: DragTarget(
              builder: (context, candidate, rejected) {
                return gotTarget ? ImageFromAsset(imageName: targetImageName,): DarkImageFromAsset(imageName: widget.imageName,);
              },
              onWillAcceptWithDetails: (details){

                String absoluteDraggedImageName = (details.data as String);
                absoluteDraggedImageName = absoluteDraggedImageName.substring(0, absoluteDraggedImageName.lastIndexOf('.'));

                print(widget.imageName.contains(absoluteDraggedImageName));
                if(mounted){
                  setState(() {
                    gotTarget = widget.imageName.contains(absoluteDraggedImageName);
                    targetImageName = details.data as String;
                  });
                }
                return widget.imageName.contains(absoluteDraggedImageName);
              },
          
              onAcceptWithDetails: (details)=>cubit.increaseExamScore(),
            ),
          ),
        );
      },
    );
  }
}
