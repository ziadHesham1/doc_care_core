import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconWithTextWidget extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String text;
  final TextStyle? textStyle;
  const AppIconWithTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: 20.h,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }
}
