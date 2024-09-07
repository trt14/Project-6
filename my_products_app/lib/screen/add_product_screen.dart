import 'package:flutter/material.dart';
import 'package:my_products_app/helper/screen.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productQTYController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add new product",
              style: TextStyle(
                  color: Color(0xff008092),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: context.getWidth(value: 1.5),
              height: context.getHight(value: 5),
              decoration: BoxDecoration(
                  color: const Color(0xffe6f5f3),
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.add,
                color: Color(0xff0d9285),
                size: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Product Name",
              controller: productNameController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Product Price",
              controller: productPriceController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Quantity",
              controller: productQTYController,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomButton(
              text: "Add",
              color: Colors.white,
              bgColor: Color(0xff008092),
            )
          ],
        ),
      ),
    );
  }
}
