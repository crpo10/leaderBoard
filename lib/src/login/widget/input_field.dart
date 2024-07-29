import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      this.isPassword = false,
      required this.hintText,
      required this.controller,
      this.validator,
      this.onFieldSubmitted});

  final bool isPassword;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
