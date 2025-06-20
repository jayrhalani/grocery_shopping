import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery_shopping/screens/404_not_found/not_found_page.dart';
import 'package:grocery_shopping/screens/home/home_page.dart';
import 'package:grocery_shopping/screens/product_details/product_details_page.dart';
import 'package:grocery_shopping/utils/nav_res.dart';

import 'screens/cart/cart_page.dart';
import 'screens/dashboard/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Plant care reminder',
          debugShowCheckedModeBanner: false,
          scrollBehavior: _MyCustomScrollBehavior(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            scaffoldBackgroundColor: const Color(0xFFF4F6F6),
            useMaterial3: true,
          ),
          unknownRoute: GetPage(
            name: NavRes.notFoundScreen,
            page: () => const NotFoundPage(),
          ),
          getPages: [
            GetPage(
              name: NavRes.dashboardScreen,
              page: () => const DashboardPage(),
            ),
            GetPage(
              name: NavRes.homeScreen,
              page: () => const HomePage(),
            ),
            GetPage(
              name: NavRes.productDetailsScreen,
              page: () => const ProductDetailsPage(),
            ),
            GetPage(
              name: NavRes.cartScreen,
              page: () => const CartPage(),
            ),
          ],
          initialRoute: NavRes.homeScreen,
        );
      },
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
