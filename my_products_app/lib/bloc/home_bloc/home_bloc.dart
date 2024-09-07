import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:my_products_app/global/product_data_layer.dart';
import 'package:my_products_app/global/user_data_layer.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final productDataLaye = GetIt.I.get<ProductDataLayer>();
  HomeBloc() : super(HomeInitial()) {
    productDataLaye.loadUserProducts(GetIt.I.get<UserDataLayer>().user!.id);
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
