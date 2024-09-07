import 'package:flutter/material.dart';
import 'package:my_products_app/helper/screen.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameUpdateController =
        TextEditingController();
    final TextEditingController productPriceUpdateController =
        TextEditingController();
    final TextEditingController productQTYUpdateController =
        TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Edit product",
              style: TextStyle(
                  color: Color(0xff008092),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              title: "Product Name",
              controller: productNameUpdateController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Product Price",
              controller: productPriceUpdateController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              title: "Quantity",
              controller: productQTYUpdateController,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomButton(
              text: "Save",
              color: Colors.white,
              bgColor: Color(0xff008092),
            )
          ],
        ),
      ),
    );
  }
}
