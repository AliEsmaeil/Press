import 'package:bloc/bloc.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:press/core/internet_connectivity/internet_connectivity.dart';
import 'package:press/core/url_launcher/url_launcher.dart';
import 'package:press/features/home/data/firebase_streamer.dart';
import 'package:press/models/average_model.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsStates> {
  OverallAverageModel? avgModel;
  StatisticsCubit() : super(StatisticsInitial()){
    getData();
  }

  static StatisticsCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void getData()async{
    emit(StatisticsLoadingState());
    if(!await InternetConnectivityChecker.isConnected()){
      emit(StatisticsErrorState(message: 'Connect to the internet!'));
      return;
    }
    var model = await FirebaseStreamer.getOverallAverage();
    avgModel = model;
    emit(StatisticsGotDataState(model: model!));
  }

  void exportExcel()async{
    emit(StatisticsLoadingState());

    if((await Permission.storage.request()).isGranted){
      var result = await FirebaseStreamer.prepareExcelSheetAndSave();
      if(result){
        emit(StatsSuccessExcelSaveState());
      }
      else{
        emit(StatsFailureExcelSaveState());
      }
    }
    else{
      emit(StatsPermissionDeniedState());
    }
  }

  void openExportedExcel()async{
    String filePath ='${(await getDownloadDirectory()).path}/gesturesStatistics.xlsx';
    emit(StatisticsLoadingState());
    if(! await URLLauncher.launchFile(filePath: filePath)){
      emit(StatisticsErrorState(message: 'Can\'t launch file, check it in downloads'));
    }
  }
}
