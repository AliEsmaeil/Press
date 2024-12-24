import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/features/statistics_screen/managers/statistics_cubit.dart';
import 'package:press/features/statistics_screen/widgets/statistics_screen_body.dart';
import 'package:press/features/statistics_screen/widgets/statistics_sliver_app_bar.dart';

class StatisticsScreen extends StatelessWidget {
  static const routeName = 'StatisticsScreen';

  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => StatisticsCubit(),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            StatisticsSliverAppBar(),
            StatisticsScreenBody(),
          ],
        ),
      ),
    );
  }
}
