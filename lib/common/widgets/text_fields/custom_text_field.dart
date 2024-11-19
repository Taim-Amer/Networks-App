import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;
  final Widget? prefixIcon;
  final bool autoValidate;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.formKey,
    this.prefixIcon,
    this.autoValidate = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: "",
        hintText: hintText?.tr,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      // autovalidateMode: autoValidate
      //     ? AutovalidateMode.onUserInteraction
      //     : AutovalidateMode.disabled,
    );
  }
}
