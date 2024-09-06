import 'package:flutter/foundation.dart';
import 'package:my_products_app/model/product_model.dart';
import 'package:my_products_app/services/setup.dart';

class ProductDataLayer {
  ProductDataLayer() {
    loadProduct();
  }
  List<ProductModel> products = [];
  List<ProductModel> userproducts = [];

  void savedProduct(ProductModel product) {
    products.add(product);
    savedProductStorage();
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

  void editProduct(int id, ProductModel editProduct) {
    for (ProductModel product in products) {
      if (product.productId == id) {
        product.name = editProduct.name;
        product.available = editProduct.available;
        product.category = editProduct.category;
        product.imageSrc = editProduct.imageSrc;
        product.price = editProduct.price;
        product.quantity = editProduct.quantity;
      }
    }
    for (ProductModel product in userproducts) {
      if (product.productId == id) {
        product.name = editProduct.name;
        product.available = editProduct.available;
        product.category = editProduct.category;
        product.imageSrc = editProduct.imageSrc;
        product.price = editProduct.price;
        product.quantity = editProduct.quantity;
      }
    }
    savedProductStorage();
  }

  void changeProductAvaliblty(int id) {
    for (ProductModel product in userproducts) {
      if (product.productId == id) {
        product.available = !product.available;
      }
    }
    for (ProductModel product in products) {
      if (product.productId == id) {
        product.available = !product.available;
      }
    }
    savedProductStorage();
  }

  //optional functions
  bool userProductStatus() => userproducts.isNotEmpty ? true : false;
  List<ProductModel> productFilter(String category) =>
      products.where((element) => element.category == category).toList();
}
