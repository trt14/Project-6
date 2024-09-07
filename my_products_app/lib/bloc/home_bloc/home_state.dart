part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class VildateState extends HomeState {}

final class HomeUpdateState extends HomeState{}

final class LogoutStatus extends HomeState{}