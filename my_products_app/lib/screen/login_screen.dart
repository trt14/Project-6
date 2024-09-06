
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products_app/bloc/login_bloc/login_bloc.dart';
import 'package:my_products_app/helper/scree.dart';
import 'package:my_products_app/screen/signup_screen.dart';
import 'package:my_products_app/widget/custom_button.dart';
import 'package:my_products_app/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<LoginBloc>();
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
                        CustomTextField(
                          title: "Email",
                          controller: emailController,
                          icon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: context.getHight(value: 30),
                        ),
                        CustomTextField(
                          title: "Password",
                          isPassword: true,
                          controller: passwordController,
                          icon: const Icon(
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
                        BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (state is LoginErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "email or password is not vaild")));
                            }
                          },
                          child: CustomButton(
                            text: "Login",
                            color: Colors.white,
                            bgColor: const Color(0xff008092),
                            onTap: () {
                              if (kDebugMode) {
                                print("login button was clik");
                              }
                              bloc.add(ActionLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context));
                            },
                          ),
                        ),
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
      }),
    );
  }
}
