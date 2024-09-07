import 'dart:convert';

class ProductModel {
  ProductModel(
      {required this.productId,
      required this.name,
      required this.price,
      required this.category,
      required this.imageSrc,
      required this.quantity,
      required this.userId});
  late  int productId;
  late  int userId;
  late String name;
  late int price;
  late String category;
  late String imageSrc;
  late int quantity;

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    imageSrc = json['imageSrc'];
    quantity = json['quantity'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['price'] = price;
    data['category'] = category;
    data['imageSrc'] = imageSrc;
    data['quantity'] = quantity;
    data['userId'] = userId;

    return data;
  }

  static String encode(List<ProductModel> products) => json.encode(
        products
            .map<Map<String, dynamic>>((product) => product.toJson())
            .toList(),
      );

  static List<ProductModel> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();
}
