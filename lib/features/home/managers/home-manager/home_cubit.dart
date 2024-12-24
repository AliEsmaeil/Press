import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:press/core/extensions/spacers.dart';
import 'package:press/core/internet_connectivity/internet_connectivity.dart';
import 'package:press/core/utils/app_keys.dart';
import 'package:press/core/validators/text_field_validator.dart';
import 'package:press/features/home/data/firebase_streamer.dart';
import 'package:press/features/home/managers/home-manager/home_state.dart';
import 'package:press/features/home/widgets/auth_dialog.dart';
import 'package:press/features/home/widgets/info_carousel.dart';
import 'package:press/features/home/widgets/main_data.dart';

import 'package:press/features/local_storage/storage_layer.dart';

class HomeCubit extends Cubit<HomeStates> {

  bool connectedToInternet = false;

  HomeCubit() : super(HomeInitial()){
    checkInternetConnection();
    setOldUser();
  }


  static HomeCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void checkInternetConnection()async{
    connectedToInternet = await InternetConnectivityChecker.isConnected();
  }

  void setOldUser()async{
    await SecureStorageLayer.putValue(key: AppKeys.newUserKey, value: false);
  }

  Future<Widget> getHomeBodyWidget()async{
    bool connected = await InternetConnectivityChecker.isConnected();
    if(connected){
      var model = await FirebaseStreamer.getOverallAverage();
      if(model == null){
        return MainData();
      }
      return  Column(
        children: [
          InfoCarousel(model: model),
          30.verticalSpacer,
          MainData(),
        ],
      );
    }
    return MainData();
  }
  void showAuthDiag(BuildContext context)async{
    bool connected = await InternetConnectivityChecker.isConnected();
    connected ? showAuthDialog(context) : emit(HomeUserNotConnectedState());
  }
  void authUser(String? password)async{
    if(!await InternetConnectivityChecker.isConnected()){
      emit(HomeUserNotConnectedState());
      return;
    }
    if(password == null || password.isEmpty){
      emit(HomeNotAuthorizedUserState());
    }
    String storedPass = await FirebaseStreamer.storedPassword();
    if(storedPass == password){
      emit(HomeAuthorizedUserState());
    }
    else{
      emit(HomeNotAuthorizedUserState());
    }
  }

  void goTest(String? age){
    String? newAge = TextFieldValidator.ageValidation(age);
    if(newAge == null){
    emit(HomeGoTestState(age: int.tryParse(age!)!));
    }
    else{
      emit(HomeWrongAgeFormatState());
    }
  }
}
