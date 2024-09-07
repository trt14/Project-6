import 'package:flutter/material.dart';
import 'package:my_products_app/helper/screen.dart';

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