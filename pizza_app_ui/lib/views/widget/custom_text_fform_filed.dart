import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? Function(String?) validator;
  final TextInputType keyboard;
  final bool obscure;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;

  const CustomTextFormFiled({
    super.key,
    required this.title,
    required this.imagePath,
    required this.validator,
    required this.keyboard,
    required this.obscure,
    required this.controller,
    required this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      // onChanged: onChanged,
      obscuringCharacter: "*",
      textInputAction: textInputAction,
      obscureText: obscure,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
          color: AppColor.textDisable,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Image(
            color: AppColor.textDisable,
            alignment: AlignmentDirectional.centerEnd,
            image: AssetImage(imagePath),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xffE2E4E9),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.dotIndicator,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: const Color(0xffFFFFFF),
        filled: true,
      ),
    );
  }
}
