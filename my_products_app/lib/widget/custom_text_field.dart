import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      this.controller,
      this.icon,
      this.isPassword = false,
      this.keyboardType,
      this.inputFormatters,
      this.errorText});
  final String title;
  final TextEditingController? controller;
  final Widget? icon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(title)),
            TextField(
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                obscureText: isPassword!,
                controller: controller,
                decoration: InputDecoration(
                  errorText: errorText,
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
