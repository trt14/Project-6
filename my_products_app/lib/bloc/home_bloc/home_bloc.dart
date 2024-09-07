import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:my_products_app/global/product_data_layer.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/model/product_model.dart';
import 'package:my_products_app/model/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final productDataLaye = GetIt.I.get<ProductDataLayer>();
  UserModel? user = GetIt.I.get<UserDataLayer>().user;
  final userDataLayer = GetIt.I.get<UserDataLayer>();
  HomeBloc() : super(HomeInitial()) {
    productDataLaye.loadUserProducts(GetIt.I.get<UserDataLayer>().user!.id);
    on<HomeEvent>((event, emit) {});
    on<AddProductEvent>(
      (event, emit) {
        event.product.userId = user!.id;
        event.product.productId = productDataLaye.products.length + 1;
        productDataLaye.savedProduct(event.product);
        Navigator.pop(event.context);
        emit(HomeUpdateState());
      },
    );
    on<UpdatedProductPageEvent>(
      (event, emit) {
        emit(HomeUpdateState());
      },
    );
    on<CheckInputEvent>(
      (event, emit) {
        emit(VildateState());
      },
    );
    on<UpdatedProductEvent>(
      (event, emit) {
        productDataLaye.updateProduct(event.product);
        Navigator.pop(event.context);

        emit(HomeUpdateState());
      },
    );
    on<LogoutEvent>(
      (event, emit) => emit(LogoutStatus()),
    );
  }
}
