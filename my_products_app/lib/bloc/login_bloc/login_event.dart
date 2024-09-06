part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ActionLoginEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  ActionLoginEvent(
      {required this.email, required this.password, required this.context});
}
