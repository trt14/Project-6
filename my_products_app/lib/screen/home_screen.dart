import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            color: const Color(0xff0d9285),
            bgColor: const Color(0xffe6f5f3),
            onTap: () {
              GetIt.I
                  .get<UserDataLayer>()
                  .changeUserState(GetIt.I.get<UserDataLayer>().user!.email);
            },
            text: "Logout"),
      ),
    );
  }
}
