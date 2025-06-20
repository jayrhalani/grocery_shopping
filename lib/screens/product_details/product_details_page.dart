import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping/model/popular_item_model.dart';
import 'package:grocery_shopping/screens/home/widgets/discount_badge.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';
import 'package:grocery_shopping/utils/common_methods.dart';
import 'package:grocery_shopping/utils/common_widget/common_button.dart';
import 'package:grocery_shopping/utils/common_widget/common_top_bar.dart';
import 'package:grocery_shopping/utils/common_widget/image_text_row.dart';
import 'package:grocery_shopping/utils/nav_res.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late PopularItemModel item;

  @override
  void initState() {
    super.initState();
    // Receive the argument here
    item = Get.arguments as PopularItemModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonTopBar(
              title: 'Products Details',
              onBackTap: () {
                Get.back();
              },
              onShareTap: () {
                print('Share button clicked!');
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.fitHeight,
                          height: 240.h,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    DiscountBadge(
                                      discount: item.discount,
                                      backgroundColor: ColorRes.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Stack(
                              alignment: Alignment.center,
                              // Ensures the icon is centered
                              children: [
                                Container(
                                  height: 48.h,
                                  width: 64.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      AssetsRes.imgMonochromeCityscape,
                                      fit: BoxFit
                                          .cover, // Makes the image fill the entire space
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                    color:
                                        ColorRes.black.withValues(alpha: 0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    AssetsRes.icLocation,
                                    height: 16.h,
                                    width: 16.h,
                                    color: ColorRes.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            ImageTextRow(
                              imagePath: AssetsRes.icBoxDelivered,
                              text: 'Available',
                            ),
                            Spacer(),
                            ImageTextRow(
                              imagePath: AssetsRes.icOnTime,
                              text: 'Time ${item.deliveryTime}',
                            ),
                            Spacer(),
                            ImageTextRow(
                              imagePath: AssetsRes.icStar,
                              text: '${item.rating} Rating',
                            )
                          ],
                        ),
                        Divider(
                          height: 36.h,
                          thickness: 0.5.h,
                          color: ColorRes.dividerColor,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        ReadMoreText(
                          item.description,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          moreStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.darkGrayishCyan,
                          ),
                          lessStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorRes.darkGrayishCyan,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (item.quantity > 1) item.quantity--;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorRes.lightGrey,
                        ),
                        child: Icon(Icons.remove_outlined, size: 20.r),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorRes.softGreen,
                        ),
                        child: Icon(Icons.add_outlined, size: 20.r),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CommonButton(
                  onTap: () {
                    navigationToNamed(NavRes.cartScreen);
                  },
                  color: ColorRes.softGreen,
                  textStyle: TextStyle(
                    color: ColorRes.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  title: 'Add to Cart',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
