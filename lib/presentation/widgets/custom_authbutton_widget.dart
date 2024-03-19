import 'package:flutter/material.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/text_styles.dart';

class CustomAuthButtonWidget extends StatelessWidget {
  const CustomAuthButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(255, 55),
          backgroundColor: AppColor.mainOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyle.mainTextButtonCollor,
        ),
      ),
    );
  }
}
