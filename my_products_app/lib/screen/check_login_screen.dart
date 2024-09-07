import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_products_app/global/user_data_layer.dart';
import 'package:my_products_app/model/user_model.dart';
import 'package:my_products_app/screen/home_screen.dart';
import 'package:my_products_app/screen/login_screen.dart';

class CheckLoginScreen extends StatelessWidget {
  const CheckLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? currentUser =GetIt.I.get<UserDataLayer>().user;
    Future.delayed(const Duration(seconds: 3), () {
      
      if ( currentUser!= null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });

    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
