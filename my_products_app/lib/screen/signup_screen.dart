import 'package:flutter/material.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? nameController = TextEditingController();
    TextEditingController? emailController = TextEditingController();
    TextEditingController? passwordController = TextEditingController();
    TextEditingController? crController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add new account",
              style: TextStyle(
                  color: Color(0xff008092),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              title: "Name",
              controller: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              title: "Email",
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              title: "Password",
              controller: passwordController,
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              title: "CR#",
              controller: crController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "SignUp", color: Colors.white, bgColor: Color(0xff008092))
          ],
        ),
      ),
    );
  }
}
