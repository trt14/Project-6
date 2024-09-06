import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/screen/home_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final userLayer = GetIt.I.get<UserDataLayer>();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<ActionLoginEvent>(
      loginCheckMethod,
    );
  }

  FutureOr<void> loginCheckMethod(event, emit) {
    if (userLayer.checkUser(email: event.email, password: event.password)) {
      Navigator.pushReplacement(event.context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState());
    }
  }
}
