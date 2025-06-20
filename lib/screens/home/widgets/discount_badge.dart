import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/utils/color_res.dart';

class DiscountBadge extends StatelessWidget {
  final int discount;
  final Color? backgroundColor;
  final Color? textColor;

  const DiscountBadge({
    super.key,
    required this.discount,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ??  ColorRes.lightGrayishCyan,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        'Discount ${discount.toStringAsFixed(0)}%',
        style: TextStyle(
          fontSize: 10.sp,
          color: textColor ?? Colors.black,
        ),
      ),
    );
  }
}
