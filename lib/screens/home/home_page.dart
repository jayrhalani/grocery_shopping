import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/model/category_model.dart';
import 'package:grocery_shopping/model/popular_item_model.dart';
import 'package:grocery_shopping/screens/home/widgets/category_item.dart';
import 'package:grocery_shopping/screens/home/widgets/custom_toggle.dart';
import 'package:grocery_shopping/screens/home/widgets/home_top_bar.dart';
import 'package:grocery_shopping/screens/home/widgets/popular_item_card.dart';
import 'package:grocery_shopping/utils/assets_res.dart';
import 'package:grocery_shopping/utils/color_res.dart';

import 'model/toggle_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  String currentSelection = 'Delivery';

  final List<CategoryModel> categories = [
    CategoryModel(name: 'Vegetables', icon: AssetsRes.icCategoryVegetables),
    CategoryModel(name: 'Fresh', icon: AssetsRes.icCategoryFruits),
    CategoryModel(name: 'Bakery', icon: AssetsRes.icCategoryBakery),
    CategoryModel(name: 'Grains', icon: AssetsRes.icCategoryGrains),
    CategoryModel(name: 'Organic', icon: AssetsRes.icCategoryOrganic),
  ];

  final List<PopularItemModel> popularItems = [
    PopularItemModel(
      name: 'Farm Fresh Produce',
      image: AssetsRes.imgVegetableBasket,
      price: 10.0,
      rating: 3.5,
      discount: 5,
      deliveryTime: '10 min',
    ),
    PopularItemModel(
      name: 'Organic Basket',
      image: AssetsRes.imgVegetableBasket,
      price: 15.0,
      rating: 4.0,
      discount: 10,
      deliveryTime: '12 min',
    ),
    // Add more items as you like
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 1,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: ColorRes.softGreen,
            selectedIndex: currentPageIndex,
            backgroundColor: ColorRes.white,
            destinations: <Widget>[
              NavigationDestination(
                icon: Image.asset(
                  AssetsRes.icNavHome,
                  height: 16.h,
                  width: 16.h,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Image.asset(
                  AssetsRes.icNavCart,
                  height: 16.h,
                  width: 16.h,
                ),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Image.asset(
                  AssetsRes.icNavFavorite,
                  height: 16.h,
                  width: 16.h,
                ),
                label: 'Favorite',
              ),
              NavigationDestination(
                icon: Image.asset(
                  AssetsRes.icNavUser,
                  height: 16.h,
                  width: 16.h,
                ),
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  const HomeTopBar(),
                  SizedBox(height: 20.h),
                  CustomToggle(
                    options: [
                      ToggleModel(
                        name: 'Delivery',
                        image: AssetsRes.icToggleDelivery,
                      ),
                      ToggleModel(
                        name: 'Pickup',
                        image: AssetsRes.icToggleTruck,
                      )
                    ],
                    initialSelection: currentSelection,
                    onSelected: (value) {
                      setState(() {
                        currentSelection = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 80.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return CategoryItem(category: category);
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Popular items',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ListView.separated(
                      itemCount: popularItems.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                          bottom: 12.h, left: 16.w, right: 16.w),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        final item = popularItems[index];
                        return PopularItemCard(item: item);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
