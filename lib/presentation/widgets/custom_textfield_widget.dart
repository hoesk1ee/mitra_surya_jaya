import 'package:flutter/material.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.obscure = false,
    this.suffix,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscure;
  final String hintText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.textFieldColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.shadowColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.mainOrangeColor,
          ),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.hintTextStyle,
        suffixIcon: suffix,
      ),
    );
  }
}
