import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/model/popular_item_model.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';
import 'package:grocery_shopping/utils/common_widget/image_text_row.dart';

class CartItemCard extends StatefulWidget {
  final PopularItemModel item;
  final VoidCallback onTap;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(12.h),
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                widget.item.image,
                fit: BoxFit.cover,
                height: 120.h,
                width: 120.h,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    widget.item.description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      ImageTextRow(
                        imageSize: 12,
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        imagePath: AssetsRes.icBoxDelivered,
                        text: 'Available',
                      ),
                      Spacer(),
                      ImageTextRow(
                        imageSize: 12,
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        imagePath: AssetsRes.icStar,
                        text: '${widget.item.rating}',
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '\$${widget.item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorRes.black,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: ColorRes.lightGrey),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.item.quantity > 1) {
                                    widget.item.quantity--;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.lightGrey,
                                ),
                                child: Icon(Icons.remove_outlined, size: 14.r),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              '${widget.item.quantity}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorRes.black,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.item.quantity++;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorRes.softGreen,
                                ),
                                child: Icon(
                                  Icons.add_outlined,
                                  size: 14.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
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
