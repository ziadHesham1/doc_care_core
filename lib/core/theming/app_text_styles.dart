import 'font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  /// 12
  static final TextStyle font12DarkBlue = TextStyle(
    fontSize: 12.sp,
    color: AppColors.darkBlue,
  );
  static final TextStyle font12PrimarySemiBold = TextStyle(
    fontSize: 12.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.semiBold,
  );

  static final TextStyle font12darkBlueSemiBold = TextStyle(
    fontSize: 12.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeightHelper.semiBold,
  );
  static final TextStyle font12lighterGrey = TextStyle(
    fontSize: 12.sp,
    color: AppColors.lighterGrey,
  );
  static final TextStyle font12Primary = TextStyle(
    fontSize: 12.sp,
    color: AppColors.primary,
  );

  /// 13
  static final TextStyle font13Grey = TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey,
  );
  static final TextStyle font13Grey80 = TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey80,
  );
  static final TextStyle font13DarkBlue = TextStyle(
    fontSize: 13.sp,
    color: AppColors.darkBlue,
  );
  static final TextStyle font13DarkBlueMedium = TextStyle(
    fontSize: 13.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  /// 14
  static final TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeightHelper.medium,
  );

  static final TextStyle font14Grey50 = TextStyle(
    color: AppColors.grey50,
    fontSize: 14.sp,
  );
  static final TextStyle font14Grey = TextStyle(
    color: AppColors.grey,
    fontSize: 14.sp,
  );
  static final font14White = TextStyle(color: Colors.white, fontSize: 14.sp);
  static final font14Primary =
      TextStyle(color: AppColors.primary, fontSize: 14.sp);

  /// 15
  static TextStyle font15DarkBlueMedium = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.darkBlue,
  );

  /// 16
  static TextStyle font16DarkBlueSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    // color: AppColors.darkBlue,
  );

  /// 24
  static final TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static final TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );

  /// 32
  static final TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    color: AppColors.primary,
    fontWeight: FontWeightHelper.bold,
  );
}
