import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_res.dart';

class Style {
  static EdgeInsets get standardPadding => EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );

  static EdgeInsets get standardBoxPadding => EdgeInsets.symmetric(
    horizontal: 10.h,
    vertical: 10.h,
  );

  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    double? height,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: (fontSize ?? 16).sp,
      fontWeight: fontWeight,
      color: color ?? ColorRes.black,
      decoration: decoration,
      height: height,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
    );
  }

  static BoxDecoration boxDecoration({
    Color? borderColor,
    Color? color,
  }) {
    return BoxDecoration(
      border: Border.all(
        color: borderColor ?? ColorRes.primaryColor.withValues(alpha: 0.2),
      ),
      color: color ?? ColorRes.white,
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}
