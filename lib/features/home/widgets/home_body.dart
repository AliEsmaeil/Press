import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/core/reusable_widgets/custom_circular_progress_indicator.dart';
import 'package:press/core/reusable_widgets/custom_snak_bar.dart';
import 'package:press/core/utils/app_colors.dart';
import 'package:press/features/home/managers/home-manager/home_cubit.dart';
import 'package:press/features/home/managers/home-manager/home_state.dart';
import 'package:press/features/statistics_screen/view/statistics_screen.dart';
import 'package:press/features/test_screen/view/test_screen.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context,state){
          if(state is HomeAuthorizedUserState){
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(StatisticsScreen.routeName);
          }
          else if (state is HomeNotAuthorizedUserState){
            Navigator.of(context).pop();
            showCustomSnack(context: context, message: 'Wrong Password', color: AppColors.errorColor);
          }
          else if(state is HomeUserNotConnectedState){
            showCustomSnack(context: context, message: 'No Internet Connection', color: Colors.black54);
          }

          else if(state is HomeGoTestState){
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(TestScreen.routeName, arguments: state.age);
          }
          else if (state is HomeWrongAgeFormatState){
            Navigator.of(context).pop();
            showCustomSnack(context: context, message: 'Wrong age format', color: AppColors.errorColor);
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.getCubit(context);

          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future:cubit.getHomeBodyWidget() ,
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CustomCircularProgressIndicator();
                    }
                    else if(snapshot.hasData && snapshot.data != null){
                      return snapshot.data!;
                    }
                    return Text('Some error has occurred! try again later');
                  }
              )
          );
        },
      ),
    );
  }
}
