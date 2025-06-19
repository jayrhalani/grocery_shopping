import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/global_widgets/circle_icon_view.dart';
import 'package:grocery_shopping/utils/assets_res.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleIconView(imagePath: AssetsRes.icLocation, size: 34.h),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery location',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Text(
                  'Green Valley Point',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleIconView(imagePath: AssetsRes.icSearch, size: 34.h),
            // Icon(Icons.search, size: 28.sp),
            SizedBox(width: 4.w),
            // Icon(Icons.notifications_none, size: 28.sp),
            CircleIconView(imagePath: AssetsRes.icNotification, size: 34.h),
          ],
        ),
      ],
    );
  }
}
