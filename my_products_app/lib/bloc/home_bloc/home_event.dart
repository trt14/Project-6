part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CheckInputEvent extends HomeEvent {}

class UpdatedProductEvent extends HomeEvent {
  final BuildContext context;
  final ProductModel product;
  UpdatedProductEvent({required this.product, required this.context});
}

class UpdatedProductPageEvent extends HomeEvent {}

class AddProductEvent extends HomeEvent {
  final BuildContext context;
  final ProductModel product;
  AddProductEvent({required this.product, required this.context});
}

class LogoutEvent extends HomeEvent {
  
}
