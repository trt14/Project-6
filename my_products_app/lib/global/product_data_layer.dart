import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/product_model.dart';
import 'package:my_products_app/services/setup.dart';

class  ProductDataLayer {
  
ProductDataLayer(){
    loadProduct();
}
  List<ProductModel> products = [];





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