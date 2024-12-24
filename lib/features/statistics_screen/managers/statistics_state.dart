part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsStates {}

final class StatisticsInitial extends StatisticsStates {}

final class StatisticsLoadingState extends StatisticsStates {}

final class StatisticsGotDataState extends StatisticsStates {
  final OverallAverageModel model;

  StatisticsGotDataState({required this.model});
}
final class StatisticsErrorState extends StatisticsStates {
  final String message;

  StatisticsErrorState({required this.message});
}
final class StatsPermissionDeniedState extends StatisticsStates{}


final class StatsSuccessExcelSaveState extends StatisticsStates{}

final class StatsFailureExcelSaveState extends StatisticsStates{}