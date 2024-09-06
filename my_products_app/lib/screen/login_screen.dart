import 'package:flutter/material.dart';
import 'package:my_products_app/helper/scree.dart';
import 'package:my_products_app/screen/signup_screen.dart';
import 'package:my_products_app/widget/custom_button.dart';
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
                    const CustomButton(
                        text: "Login",
                        color: Colors.white,
                        bgColor: Color(0xff008092)),
                    SizedBox(
                      height: context.getHight(value: 10),
                    ),
                    const Text("Don't have an account?"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Register",
                      color: const Color(0xff0d9285),
                      bgColor: const Color(0xffe6f5f3),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
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
