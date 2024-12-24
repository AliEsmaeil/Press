import 'package:flutter/material.dart';
import 'package:press/features/about_screen/about_screen.dart';
import 'package:press/features/home/view/home_screen.dart';
import 'package:press/features/statistics_screen/view/statistics_screen.dart';
import 'package:press/features/test_screen/view/test_screen.dart';
import 'package:press/splash_screen/splash_screen.dart';

final class MyRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {

      SplashScreen.routeName =>
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      HomeScreen.routeName =>
        MaterialPageRoute(builder: (context) => const HomeScreen()),

      AboutScreen.routeName =>
          MaterialPageRoute(builder: (context) => const AboutScreen()),
      StatisticsScreen.routeName =>
          MaterialPageRoute(builder: (context) => const StatisticsScreen()),
      TestScreen.routeName =>
          MaterialPageRoute(builder: (context) => TestScreen(age: (settings.arguments as int),)),
      _ => MaterialPageRoute(builder: (context) => const HomeScreen()),
    };
  }
}
