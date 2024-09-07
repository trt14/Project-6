import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_products_app/bloc/home_bloc/home_bloc.dart';
import 'package:my_products_app/helper/screen.dart';
import 'package:my_products_app/model/product_model.dart';
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
    String? imageSrc = "";
    bool nameValidator = false;
    bool priceValidator = false;
    bool qtyValidator = false;
    String priceErrorMessage = "";
    String qtyErrorMessage = "";
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();
        return Scaffold(
          body: Center(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Column(
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
                      child: IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          try {
                            imageSrc = image!.path;
                          } catch (e) {
                            if (kDebugMode) {
                              print("value of $imageSrc");
                              imageSrc == "" ? print("true") : print("false");
                              print(e);
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xff0d9285),
                          size: 100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      title: "Product Name",
                      controller: productNameController,
                      errorText:
                          nameValidator ? "the name can not be empty" : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: "Product Price",
                        controller: productPriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.deny(RegExp(r'\s'))
                        ],
                        errorText: priceValidator ? priceErrorMessage : null),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      title: "Quantity",
                      controller: productQTYController,
                      errorText: qtyValidator ? qtyErrorMessage : null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.deny(RegExp(r'\s'))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocListener<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state is VildateState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("you must meet all requirment")));
                        }
                      },
                      child: CustomButton(
                        text: "Add",
                        color: Colors.white,
                        bgColor: const Color(0xff008092),
                        onTap: () {
                          int? price =
                              int.tryParse(productPriceController.text);
                          int? qty = int.tryParse(productQTYController.text);

                          if (productNameController.text.trim().isEmpty) {
                            nameValidator = true;
                          } else {
                            nameValidator = false;
                          }
                          if (productPriceController.text.trim().isEmpty) {
                            priceValidator = true;
                            priceErrorMessage = "the pirce can not be empty";
                          } else {
                            priceValidator = false;
                          }
                          if (productQTYController.text.trim().isEmpty) {
                            qtyValidator = true;
                            qtyErrorMessage = "the quntity can not be empty";
                          } else {
                            qtyValidator = false;
                          }
                          if (qty != null) {
                            if (qty < 0) {
                              qtyValidator = true;
                              qtyErrorMessage = "the qunitity can not be <0";
                            }
                          }
                          if (price != null) {
                            if (price <= 0) {
                              priceValidator = true;
                              priceErrorMessage = "the price can not be < 0";
                            } else {
                              priceValidator = false;
                            }
                          } else {
                            priceValidator = true;
                            priceErrorMessage = "can not be empty";
                          }
                          if (priceValidator || qtyValidator || nameValidator) {
                            bloc.add(CheckInputEvent());
                          } else {
                            nameValidator = false;
                            priceValidator = false;
                            qtyValidator = false;

                            addNewProduct(
                                nameValidator: nameValidator,
                                priceValidator: priceValidator,
                                qtyValidator: qtyValidator,
                                bloc: bloc,
                                context: context,
                                productNameController: productNameController,
                                price: price,
                                qty: qty,
                                imageSrc: imageSrc!);
                          }
                          if (imageSrc != "" || imageSrc != null) {
                            imageSrc = "assets/images/placeholder.png";
                          }
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }

  void addNewProduct(
      {required bool nameValidator,
      required bool priceValidator,
      required bool qtyValidator,
      required HomeBloc bloc,
      required BuildContext context,
      required TextEditingController productNameController,
      required int? price,
      required int? qty,
      required String imageSrc}) {
    if (!nameValidator && !priceValidator && !qtyValidator) {
      bloc.add(AddProductEvent(
          context: context,
          product: ProductModel(
              productId: 0,
              name: productNameController.text,
              price: price!,
              category: "",
              imageSrc: imageSrc,
              quantity: qty!,
              userId: 0)));
    }
  }
}
