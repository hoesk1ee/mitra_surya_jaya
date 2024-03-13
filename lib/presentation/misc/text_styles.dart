import 'package:flutter/material.dart';
import 'package:mitra_surya_jaya/presentation/misc/colors.dart';
import 'package:mitra_surya_jaya/presentation/misc/size.dart';

class AppTextStyle {
  static const titleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppSize.titleTextSize,
  );
  static const hintTextStyle = TextStyle(
    color: AppColor.hintTextColor,
    fontSize: AppSize.hintTextSize,
  );
  static const mainColorTextStyle = TextStyle(
    color: AppColor.mainOrangeColor,
  );
  static const mainTextButtonCollor = TextStyle(
    color: AppColor.mainWhiteColor,
  );
  static const smallSizeTextStyle = TextStyle(
    fontSize: AppSize.hintTextSize,
  );
}
