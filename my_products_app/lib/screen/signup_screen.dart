import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_products_app/bloc/signup_bloc/signup_bloc.dart';
import 'package:my_products_app/model/user_model.dart';
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

    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignupBloc>();

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
                BlocListener<SignupBloc, SignupState>(
                  listener: (context, state) {
                    if (state is SignupErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: CustomButton(
                      onTap: () {
                        bloc.add(CreateAccountEvent(
                            context: context,
                            user: UserModel(
                                name: nameController.text,
                                password: passwordController.text,
                                id: 0,
                                cr: crController.text,
                                email: emailController.text,
                                status: false)));
                      },
                      text: "SignUp",
                      color: Colors.white,
                      bgColor: const Color(0xff008092)),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
