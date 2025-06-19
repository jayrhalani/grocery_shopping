import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';
import 'package:grocery_shopping/utils/style.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsRes.imgNotFound,
                height: Get.height / 3,
              ),
              SizedBox(height: 10.h),
              Text(
                '404',
                textAlign: TextAlign.center,
                style: Style.textStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sorry, we couldn\'t find the page!',
                textAlign: TextAlign.center,
                style: Style.textStyle(
                  fontSize: 12,
                  color: ColorRes.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
