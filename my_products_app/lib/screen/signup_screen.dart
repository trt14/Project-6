import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    bool emailValidator = false;
    bool passwordValidator = false;
    bool nameValidator = false;
    bool crValidator = false;
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignupBloc>();

        return SafeArea(
          child: Scaffold(
            body: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                return Column(
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
                      errorText: nameValidator ? "can not be empty" : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      errorText:
                          emailValidator ? "email must containe @" : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: "Password",
                      controller: passwordController,
                      isPassword: true,
                      errorText: passwordValidator ? "the length must 7" : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: "CR#",
                      controller: crController,
                      errorText: crValidator ? "can not be empty" : null,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocListener<SignupBloc, SignupState>(
                      listener: (context, state) {
                        if (state is SignupErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        }
                      },
                      child: CustomButton(
                          onTap: () {
                            if (emailController.text.contains("@") &&
                                passwordController.text.trim().length == 7 &&
                                nameController.text.trim().isNotEmpty &&
                                crController.text.trim().isNotEmpty) {
                              emailValidator = false;
                              passwordValidator = false;
                              nameValidator = false;
                              crValidator = false;
                              bloc.add(CreateAccountEvent(
                                  context: context,
                                  user: UserModel(
                                      name: nameController.text.trim(),
                                      password: passwordController.text.trim(),
                                      id: 0,
                                      cr: crController.text.trim(),
                                      email: emailController.text.trim(),
                                      status: false)));
                            } else {
                              if (!emailController.text.contains("@")) {
                                emailValidator = true;
                              } else {
                                emailValidator = false;
                              }
                              if (passwordController.text.trim().length < 7) {
                                passwordValidator = true;
                              } else {
                                passwordValidator = false;
                              }

                              if (!nameController.text.trim().isNotEmpty) {
                                nameValidator = true;
                              } else {
                                nameValidator = false;
                              }
                              if (!crController.text.trim().isNotEmpty) {
                                crValidator = true;
                              } else {
                                crValidator = false;
                              }
                              bloc.add(FaildCreateAccountEvent());
                            }
                          },
                          text: "SignUp",
                          color: Colors.white,
                          bgColor: const Color(0xff008092)),
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
}
