import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shopping/utils/assets_res.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              SizedBox(height: 20.h),
              _buildCategorySelection(),
              SizedBox(height: 20.h),
              Text(
                'Popular items',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              _buildPopularItemCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.green),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivery location', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                Text('Green Valley Point', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.search, size: 28.sp),
            SizedBox(width: 16.w),
            Icon(Icons.notifications_none, size: 28.sp),
          ],
        ),
      ],
    );
  }

  Widget _buildCategorySelection() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCategoryOption('Delivery', true),
              _buildCategoryOption('Pickup', false),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategoryIcon(Icons.set_meal_outlined, 'Meats'),
            _buildCategoryIcon(Icons.eco_outlined, 'Fresh'),
            _buildCategoryIcon(Icons.cake_outlined, 'Bakery'),
            _buildCategoryIcon(Icons.rice_bowl_outlined, 'Grains'),
            _buildCategoryIcon(Icons.local_florist_outlined, 'Organic'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryOption(String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black, size: 28.sp),
        ),
        SizedBox(height: 6.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  Widget _buildPopularItemCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
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
            child: Image.asset(AssetsRes.imgVegetableBasket),
          ),
          SizedBox(height: 10.h),
          Text(
            'Farm Fresh Produce',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16.sp),
              SizedBox(width: 4.w),
              Text('3.5', style: TextStyle(fontSize: 14.sp)),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text('Discount 5%', style: TextStyle(fontSize: 12.sp, color: Colors.green)),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text('\$10.00', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.delivery_dining, size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text('Delivered', style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 10.w),
              Icon(Icons.timer_outlined, size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text('Time 10 min', style: TextStyle(fontSize: 12.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
