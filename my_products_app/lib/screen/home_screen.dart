import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/helper/screen.dart';
import 'package:my_products_app/screen/add_product_screen.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardStatic(text: "Active Products", numActiveProduct: 15),
                SizedBox(
                  width: 20,
                ),
                CustomCardStatic(
                    text: "Unactive Products", numActiveProduct: 15),
              ],
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 0,
                    id: 1,
                    onTap: () {},
                    onPressedUpdateQTY: () {},
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 5,
                    id: 1,
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 3,
                    id: 1,
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 20,
                    id: 1,
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 3000,
                    id: 1,
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 300,
                    id: 1,
                  ),
                  const CustomCardProduct(
                    imgSrc: "assets/images/adidas-shoes1.png",
                    productName: "Something",
                    productPrice: 1300,
                    qty: 200,
                    id: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddProductScreen()));
          },
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff008092),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct(
      {super.key,
      required this.imgSrc,
      required this.productName,
      required this.productPrice,
      required this.qty,
      this.onLongPress,
      this.onTap,
      this.controller,
      this.onPressedUpdateQTY,
      required this.id});
  final String imgSrc;
  final String productName;
  final int productPrice;
  final int qty;
  final int id;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onPressedUpdateQTY;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: context.getHight(value: 5),
              child: AlertDialog(
                title: Text('Update QTY $productName'),
                content: SizedBox(
                  height: 100,
                  child: CustomTextField(
                    controller: controller,
                    title: 'QTY Item',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (controller != null) {
                        controller!.clear();
                      }
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('save'),
                    onPressed: onPressedUpdateQTY,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: context.getWidth(value: 2.5),
        height: context.getWidth(value: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffe6f5f3)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgSrc,
                  width: 120,
                  height: 80,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  productName,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$productPrice SAR",
                  style: const TextStyle(color: Color(0xff0d9285)),
                ),
              ],
            ),
            Positioned(
                top: 10,
                left: 15,
                child: Text(
                  "QTY:$qty",
                  style: TextStyle(color: qty == 0 ? Colors.red : Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class CustomCardStatic extends StatelessWidget {
  const CustomCardStatic(
      {super.key, required this.text, required this.numActiveProduct});
  final String text;
  final int numActiveProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(value: 2.4),
      height: context.getWidth(value: 5),
      decoration: BoxDecoration(
          color: const Color(0xff008092),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "#$numActiveProduct",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
