import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.controller,
      this.icon,
      this.isPassword = false});
  final String title;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(title)),
            TextField(
                obscureText: isPassword!,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff008092),
                    ),
                  ),
                  hintText: "Enter your $title",
                  suffixIcon: icon,
                  border: const OutlineInputBorder(),
                )),
          ],
        ),
      ),
    );
  }
}
