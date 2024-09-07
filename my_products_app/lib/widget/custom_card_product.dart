import 'package:flutter/material.dart';
import 'package:my_products_app/helper/screen.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

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
                    onPressed: onPressedUpdateQTY,
                    child: const Text('save'),
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