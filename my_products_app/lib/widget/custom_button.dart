import 'package:flutter/material.dart';
import 'package:my_products_app/helper/screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      this.onTap,
      required this.bgColor});
  final String text;
  final Color color;
  final Color bgColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.getWidth(),
        constraints: const BoxConstraints(maxWidth: 400),
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
