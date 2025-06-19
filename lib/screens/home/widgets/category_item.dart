import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/model/category_model.dart';
import 'package:grocery_shopping/utils/color_res.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: ColorRes.white,
          child: Image.asset(category.icon, height: 24.h, width: 24.h),
        ),
        SizedBox(height: 6.h),
        Text(category.name, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
