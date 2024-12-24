import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:press/core/router/router.dart';
import 'package:press/core/utils/start_handler.dart';
import 'package:press/features/home/managers/home-manager/home_cubit.dart';

import 'firebase_options.dart';

void main() async{

  WidgetsBinding widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
   String startRoute = await  StartHandler.getStartingRoute();
  runApp(PressApp(initialRoute: startRoute,));

}
class PressApp extends StatelessWidget {
  final String initialRoute;
  const PressApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: MyRouter.onGenerateRoute,
        title: 'Press',

      ),
    );
  }
}
