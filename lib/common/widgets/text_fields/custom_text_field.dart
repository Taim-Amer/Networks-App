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
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;

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
    this.textStyle,
    this.hintStyle,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.errorBorderColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {

    // final customColors = Theme.of(context).extension<AppColorsExtension>()!;
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintText: hintText?.tr,
          hintStyle: hintStyle ??
              const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
      ),
    );
  }
}
