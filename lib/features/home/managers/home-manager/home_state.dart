
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeUserNotConnectedState extends HomeStates{}

final class HomeAuthorizedUserState extends HomeStates{}

final class HomeNotAuthorizedUserState extends HomeStates{}

final class HomeGoTestState extends HomeStates{
  final int age;

  HomeGoTestState({required this.age});
}
final class HomeWrongAgeFormatState extends HomeStates{}