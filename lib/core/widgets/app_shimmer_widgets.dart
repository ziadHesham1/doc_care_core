import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/app_colors.dart';

class RectangleShimmerWidget extends StatelessWidget {
  const RectangleShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey30,
      highlightColor: Colors.white,
      child: Container(
        height: 120.h,
        width: 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.grey30,
        ),
      ),
    );
  }
}

class TextShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;

  const TextShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        baseColor: AppColors.grey30,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.grey30,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class CircleShimmerItem extends StatelessWidget {
  final double? height;
  final double? width;
  const CircleShimmerItem({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey30,
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        height: height ?? 56.h,
        width: width ?? 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: AppColors.aliceBlue,
        ),
      ),
    );
  }
}
