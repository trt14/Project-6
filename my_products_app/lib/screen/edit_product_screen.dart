import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products_app/bloc/home_bloc/home_bloc.dart';

import 'package:my_products_app/model/product_model.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameUpdateController =
        TextEditingController();
    final TextEditingController productPriceUpdateController =
        TextEditingController();
    final TextEditingController productQTYUpdateController =
        TextEditingController();
    productNameUpdateController.text = product.name;
    productPriceUpdateController.text = product.price.toString();
    productQTYUpdateController.text = product.quantity.toString();
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();

        return Scaffold(
          body: SafeArea(
            child: Center(
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    title: "Quantity",
                    controller: productQTYUpdateController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'\s'))
                    ],    
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: "Save",
                    onTap: () {
                      if (productNameUpdateController.text == "") {
                        productNameUpdateController.text = product.name;
                      }
                      if (productQTYUpdateController.text == "") {
                        productQTYUpdateController.text =
                            product.quantity.toString();
                      }
                      if (productPriceUpdateController.text == "") {
                        productPriceUpdateController.text =
                            product.price.toString();
                      }
                      product.name = productNameUpdateController.text;
                      product.price =
                          int.tryParse(productPriceUpdateController.text)!;
                      product.quantity =
                          int.tryParse(productQTYUpdateController.text)!;

                      bloc.add(UpdatedProductEvent(
                          product: product, context: context));
                    },
                    color: Colors.white,
                    bgColor: const Color(0xff008092),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
