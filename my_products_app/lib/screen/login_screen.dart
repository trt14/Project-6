import 'package:flutter/material.dart';
import 'package:my_products_app/helper/scree.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: context.getWidth(value: 1.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.getHight(value: 10),
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                      color: Color(0xff008092),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text("Hello there👋,sign in to continue!"),
                SizedBox(
                  height: context.getHight(value: 30),
                ),
                Column(
                  children: [
                    const CustomTextField(
                      title: "Email",
                      icon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: context.getHight(value: 30),
                    ),
                    const CustomTextField(
                      title: "Password",
                      isPassword: true,
                      icon: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("forget password?")),
                    ),
                    SizedBox(
                      height: context.getHight(value: 15),
                    ),
                    Container(
                      width: context.getWidth(),
                      constraints: const BoxConstraints(maxWidth: 400),
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff008092),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: context.getHight(value: 10),
                    ),
                    const Text("Don't have an account?"),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: context.getWidth(),
                      constraints: const BoxConstraints(maxWidth: 400),
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xffe6f5f3),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Color(0xff0d9285),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
