import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/utils/color_res.dart';

class ImageTextRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final double imageSize;
  final Color? imageColor;
  final TextStyle? textStyle;

  final double spacing;
  const ImageTextRow({
    super.key,
    required this.imagePath,
    required this.text,
    this.imageSize = 16.0,
    this.imageColor,
    this.spacing = 4.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: imageSize.h,
          width: imageSize.h,
          color: imageColor,
        ),
        SizedBox(width: spacing.w),
        Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 12.sp,
                color: ColorRes.darkGrayishCyan,
              ),
        ),
      ],
    );
  }
}
