import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/global_widgets/circle_icon_view.dart';
import 'package:grocery_shopping/utils/assets_res.dart';

class CommonTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onShareTap;

  const CommonTopBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackTap,
            child: CircleIconView(imagePath: AssetsRes.icBack, size: 34.h),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onShareTap,
            child: CircleIconView(imagePath: AssetsRes.icShare, size: 34.h),
          ),
        ],
      ),
    );
  }
}
