import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/model/popular_item_model.dart';
import 'package:grocery_shopping/screens/home/widgets/discount_badge.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';

class PopularItemCard extends StatelessWidget {
  final PopularItemModel item;
  final VoidCallback onTap;

  const PopularItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                height: 160.h,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        AssetsRes.icStar,
                        height: 16.h,
                        width: 16.h,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        item.rating.toString(),
                        style:
                            TextStyle(fontSize: 14.sp, color: ColorRes.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      DiscountBadge(discount: item.discount),
                    ],
                  ),
                  Divider(
                    thickness: 0.5.h,
                    color: ColorRes.dividerColor,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetsRes.icBoxDelivered,
                        height: 16.h,
                        width: 16.h,
                        color: ColorRes.black,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Available',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorRes.black,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        AssetsRes.icOnTime,
                        height: 16.h,
                        width: 16.h,
                        color: ColorRes.black,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Time ${item.deliveryTime}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorRes.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
