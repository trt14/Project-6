import 'package:get_it/get_it.dart';
import 'package:my_products_app/global/product_data_layer.dart';
import 'package:my_products_app/global/user_data_layer.dart';
Future<void> setup() async {
  GetIt.I.registerSingleton<UserDataLayer>(UserDataLayer());

  GetIt.I.registerSingleton<ProductDataLayer>(ProductDataLayer());

}
