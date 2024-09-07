import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products_app/bloc/home_bloc/home_bloc.dart';
import 'package:my_products_app/widget/custom_card_product.dart';
import 'package:my_products_app/widget/custom_card_static.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<HomeBloc>();
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
                    CustomCardStatic(
                        text: "Active Products", numActiveProduct: 15),
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
                    children: bloc.productDataLaye.userproducts
                        .map((product) => CustomCardProduct(
                            imgSrc: product.imageSrc,
                            productName: product.name,
                            productPrice: product.price,
                            qty: product.quantity,
                            id: product.productId))
                        .toList()
        
                    ,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
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
