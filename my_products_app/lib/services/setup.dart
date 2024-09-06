import 'package:get_it/get_it.dart';
import 'package:my_products_app/global/product_data_layer.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences storage;
Future<void> setup() async {
  storage = await SharedPreferences.getInstance();

  GetIt.I.registerSingleton<UserDataLayer>(UserDataLayer());

  GetIt.I.registerSingleton<ProductDataLayer>(ProductDataLayer());
}
