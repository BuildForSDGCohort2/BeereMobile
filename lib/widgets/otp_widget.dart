import 'package:beere_mobile/utils/app_colors.dart';
import 'package:beere_mobile/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'on_tap_fade.dart';

class OtpBox extends StatelessWidget {
  const OtpBox(this.digit, {super.key});

  final int digit;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60.r,
      height: 60.r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          border: Border.all(
              color: digit.isNegative ? kLightGray : kPrimaryBlue,
              width: digit.isNegative ? 0.5 : 1)),
      child: MyText(digit != -1 ? digit.toString() : '',
          fontSize: 32.sp, color: kPrimaryBlue),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    super.key,
    required this.mainNumber,
    required this.onPressed,
    this.filled,
    this.textColor,
    this.textFontSize,
  });

  final String mainNumber;
  final VoidCallback onPressed;
  final bool? filled;
  final Color? textColor;
  final double? textFontSize;

  @override
  Widget build(BuildContext context) {
    return OnTapFade(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(maxWidth: 88.w),
        padding: textFontSize == null
            ? EdgeInsets.symmetric(vertical: 12.h, horizontal: 38.w)
            : EdgeInsets.symmetric(horizontal: 12.w),
        //width: 100.w,
        decoration: BoxDecoration(
          color: filled == null || filled == true
              ? kPrimaryBlue
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Center(
          child: MyText(mainNumber,
              textAlign: TextAlign.center,
              color: textColor ?? kWhite,
              fontSize: textFontSize ?? 20.sp,
              height: 2.sp,
              letterSpacing: -0.2.sp),
        ),
      ),
    );
  }
}