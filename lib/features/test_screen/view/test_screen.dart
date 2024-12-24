import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/reusable_widgets/custom_circular_progress_indicator.dart';
import 'package:press/core/reusable_widgets/custom_snak_bar.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/core/utils/app_visula_properties.dart';
import 'package:press/features/home/view/home_screen.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';
import 'package:press/features/test_screen/view/dragging_game_pageview.dart';

class TestScreen extends StatelessWidget {
  static const routeName = "TestScreen";
  final int age;

  const TestScreen({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,
        title: Text('Drag to target'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(AppVisualProperties.kPadding),
        child: BlocProvider(
          create: (context) => TestCubit(age: age,),
          child: BlocBuilder<TestCubit, TestState>(
            builder: (context, state) {
              var cubit = TestCubit.getCubit(context);
              if (state is TestLoadingState || cubit.gameModel == null) {
                return Center(child: CustomCircularProgressIndicator(),);
              }
              if (state is TestCompletedState) {
                WidgetsBinding.instance.addPostFrameCallback((d){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.routeName, (route) => false);
                });
              }
              if (state is TestNotConnectedState) {
                showCustomSnack(context: context,
                    message: 'You are offline, try later',
                    color: AppColors.errorColor,
                    actionButton: SnackBarAction(label: 'go home',
                        onPressed: () =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName, (route) => false)));
              }
              return DraggingGamePageview(gameModel: cubit.gameModel!);
            },
          ),
        ),
      ),
    );
  }
}
