import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products_app/bloc/home_bloc/home_bloc.dart';
import 'package:my_products_app/screen/add_product_screen.dart';
import 'package:my_products_app/screen/check_login_screen.dart';
import 'package:my_products_app/screen/edit_product_screen.dart';
import 'package:my_products_app/widget/custom_card_product.dart';
import 'package:my_products_app/widget/custom_card_static.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController qtyController = TextEditingController();
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        bloc.userDataLayer.changeUserState(bloc.user!.email);
                        bloc.user = null;
                        bloc.add(LogoutEvent());

                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => const CheckLoginScreen()))
                            .then((value) {});
                      },
                      icon: const Icon(Icons.logout_outlined)),
                )
              ],
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCardStatic(
                            text: "Active Products",
                            numActiveProduct:
                                bloc.productDataLaye.activeProducts()),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomCardStatic(
                            text: "Unactive Products",
                            numActiveProduct:
                                bloc.productDataLaye.unctiveProducts()),
                      ],
                    );
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeInitial || state is HomeUpdateState) {
                      return Expanded(
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: bloc.productDataLaye.userproducts
                              .map((product) => CustomCardProduct(
                                  controller: qtyController,
                                  onPressedUpdateQTY: () {
                                    product.quantity =
                                        int.tryParse(qtyController.text)!;
                                    bloc.add(UpdatedProductEvent(
                                        product: product, context: context));
                                    qtyController.clear();
                                  },
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProductScreen(
                                                    product: product))).then(
                                      (value) {
                                        bloc.add(UpdatedProductPageEvent());
                                      },
                                    );
                                  },
                                  imgSrc: product.imageSrc,
                                  productName: product.name,
                                  productPrice: product.price,
                                  qty: product.quantity,
                                  id: product.productId))
                              .toList(),
                        ),
                      );
                    }
                    return const Center(
                      child: Text("x_x data was not load\nrestart the app"),
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProductScreen())).then(
                  (value) {
                    bloc.add(UpdatedProductPageEvent());
                  },
                );
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xff008092),
              child: const Icon(Icons.add),
            ),
          ),
        );
      }),
    );
  }
}
