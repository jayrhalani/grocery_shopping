import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping/model/popular_item_model.dart';
import 'package:grocery_shopping/screens/cart/widget/cart_item_card.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';
import 'package:grocery_shopping/utils/common_widget/common_button.dart';
import 'package:grocery_shopping/utils/common_widget/common_top_bar.dart';
import 'package:grocery_shopping/utils/common_widget/divider_dotted.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<PopularItemModel> popularItems = [
    PopularItemModel(
      name: 'Farm Fresh Produce',
      image: AssetsRes.imgVegetableBasket,
      price: 10.0,
      rating: 3.5,
      discount: 5,
      quantity: 4,
      deliveryTime: '10 min',
      description: 'Fresh healthy, farm-to-table goodness!',
    ),
    PopularItemModel(
      name: 'Organic Basket',
      image: AssetsRes.imgVegetableBasket,
      price: 15.0,
      rating: 4.0,
      discount: 10,
      quantity: 5,
      deliveryTime: '12 min',
      description: 'Fresh healthy, farm-to-table goodness!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonTopBar(
              title: 'Cart',
              onBackTap: () {
                Get.back();
              },
              onShareTap: () {
                print('Share button clicked!');
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount: popularItems.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final item = popularItems[index];
                  return CartItemCard(
                    item: item,
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.h),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: Offset(0, -1),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSummaryRow('Subtotal', '\$10.00'),
            SizedBox(height: 8.h),
            DividerDotted(),
            SizedBox(height: 8.h),
            _buildSummaryRow('Delivery Fee', '\$2.00'),
            SizedBox(height: 8.h),
            DividerDotted(),
            SizedBox(height: 8.h),
            _buildSummaryRow('Discount', '5%'),
            SizedBox(height: 8.h),
            DividerDotted(),
            SizedBox(height: 8.h),
            _buildSummaryRow('Total', '\$12.00'),
            SizedBox(height: 16.h),
            CommonButton(
              onTap: () {
                print('Buy Now clicked!');
              },
              color: ColorRes.softGreen,
              textStyle: TextStyle(
                color: ColorRes.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              title: 'Buy Now',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
