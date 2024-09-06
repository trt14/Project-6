part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class CreateAccountEvent extends SignupEvent {
  final UserModel user;
  final BuildContext context;
  CreateAccountEvent({required this.user, required this.context});
}
class FaildCreateAccountEvent extends SignupEvent{
  
}