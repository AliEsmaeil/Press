import 'package:press/core/utils/app_keys.dart';
import 'package:press/features/home/view/home_screen.dart';
import 'package:press/features/local_storage/storage_layer.dart';
import 'package:press/splash_screen/splash_screen.dart';

final class StartHandler{

  static Future<String> getStartingRoute()async{
    bool? newUser = await SecureStorageLayer.getValue(key: AppKeys.newUserKey);
    if(newUser == null || newUser){
      return SplashScreen.routeName;
    }
    return HomeScreen.routeName;
  }
}