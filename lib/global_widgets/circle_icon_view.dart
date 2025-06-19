import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconView extends StatelessWidget {
  final String imagePath;
  final double? size;

  const CircleIconView({
    super.key,
    required this.imagePath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 46.h,
      height: size ?? 46.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: (size ?? 46.h) * 0.6,
          height: (size ?? 46.h) * 0.6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
