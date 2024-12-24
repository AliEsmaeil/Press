import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:press/features/home/managers/home-manager/home_cubit.dart';
import 'package:press/features/home/widgets/home_body.dart';
import 'package:press/features/home/widgets/home_sliver_appbar.dart';
import 'package:press/features/test_screen/managers/test_cubit.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              HomeSliverAppbar(),
              HomeBody(),
            ],
          )
      ),
    );
  }
}
