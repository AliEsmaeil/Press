part of 'test_cubit.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}
final class TestLoadingState extends TestState {}
final class TestGotDataState extends TestState {}
final class TestCompletedState extends TestState{}
final class TestNotConnectedState extends TestState{}
