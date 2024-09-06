import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  ProductDataLayer {
  
ProductDataLayer(){
    init();
    loadProduct();
}
  List<ProductModel> products = [];

  late final SharedPreferences storage;


  void init() async {
    storage = await SharedPreferences.getInstance();
  }

  void savedProduct(ProductModel product) {
    products.add(product);
    savedProductStorage(product);
  }



  void savedProductStorage(ProductModel product) {
    try {
      storage.setString("product", ProductModel.encode(products));
    } catch (e) {
      if (kDebugMode) {
        print("error in saving product");
      }
    }
  }




  
void loadProduct(){
    try {
      if (storage.containsKey("product")) {
        products = ProductModel.decode(storage.getString("product")!);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in load product data");
      }
    }

}
}