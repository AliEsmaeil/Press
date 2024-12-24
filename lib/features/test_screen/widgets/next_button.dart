import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (m){
        print('NEXT TAPPED move');
        TestCubit.touchPressure.add(m.pressure);
      },
      onPointerUp: (up){
        print('NEXT TAPPED UPPPPPPPPPPPPPPPPPPPPPPPPP');
        TestCubit.touchCount++;
        TestCubit.touchPressure.add(up.pressure);
      },

      child: IconButton(onPressed: onPressed, icon: Icon(Icons.navigate_next_outlined)
      ,style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(60,60)),
          backgroundColor: WidgetStatePropertyAll(Color(0xffb4ed15)),
          padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50) ,)),
          overlayColor: WidgetStatePropertyAll(AppColors.primaryColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
    );
  }
}
