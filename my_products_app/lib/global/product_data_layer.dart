import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/product_model.dart';
import 'package:my_products_app/services/setup.dart';

class ProductDataLayer {
  ProductDataLayer() {
    loadProduct();
  }
  List<ProductModel> products = [
    ProductModel(
        productId: 1,
        name: "Shose",
        price: 1300,
        category: "Cloth",
        imageSrc: "assets/images/placeholder.png",
        quantity: 0,
        userId: 1)
  ];
  List<ProductModel> userproducts = [];

  void savedProduct(ProductModel product) {
    products.add(product);
    userproducts.add(product);
    savedProductStorage();
  }

  int activeProducts() {
    return userproducts
        .where((element) => element.quantity > 0)
        .toList()
        .length;
  }

  int unctiveProducts() {
    return userproducts
        .where((element) => element.quantity == 0)
        .toList()
        .length;
  }

  void savedProductStorage() {
    try {
      storage.setString("product", ProductModel.encode(products));
    } catch (e) {
      if (kDebugMode) {
        print("error in saving product");
      }
    }
  }

  void loadProduct() {
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

  void loadUserProducts(int id) {
    userproducts = products.where((element) => element.userId == id).toList();
  }

  void updateProduct(ProductModel product) {
    for (var element in products) {
      if (element.productId == product.productId) {
        element.name = product.name;
        element.price = product.price;
        element.quantity = product.quantity;
      }
    }
    savedProductStorage();
    loadUserProducts(product.userId);
  }
}
