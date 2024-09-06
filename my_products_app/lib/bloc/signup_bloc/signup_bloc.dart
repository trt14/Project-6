import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/model/user_model.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final userLayer = GetIt.I.get<UserDataLayer>();
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<CreateAccountEvent>(signupMethod);
    on<FaildCreateAccountEvent>(
      (event, emit) {
        emit(
            SignupErrorState(message: "you must comply with all requiredment"));
      },
    );
  }

  FutureOr<void> signupMethod(event, emit) {
    if (kDebugMode) {
      print("SignUp Method");
    }
    UserModel user = event.user;
    userLayer.saveUser(
        name: user.name,
        pass: user.password,
        cr: user.cr,
        email: user.email,
        status: user.status);
    if (userLayer.checkUser(email: user.email, password: user.password)) {
      emit(SignupSuccessState());
      Navigator.pop(event.context);
    } else {
      emit(SignupErrorState(message: "faild to signup"));
    }
  }
}
