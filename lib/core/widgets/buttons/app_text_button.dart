import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theming/app_colors.dart';

/// Custom TextButton with similar properties as AppElevatedButton
class AppTextButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String label;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? leadingIcon;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    var font16PrimaryBold = TextStyle(
      fontSize: 16.sp,
      color: backgroundColor ?? AppColors.primary,
      fontWeight: FontWeight.w700,
    );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        ),
        foregroundColor: backgroundColor,
        minimumSize: getButtonSize(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...{
            leadingIcon!,
            SizedBox(width: 10.w),
          },
          Text(
            label,
            style: textStyle ?? (font16PrimaryBold),
          ),
        ],
      ),
    );
  }

  getButtonSize() {
    if (width != null && height != null) {
      return Size(width!, height!);
    } else if (width == null && height != null) {
      return Size.fromHeight(height!);
    } else if (width != null && height == null) {
      return Size(width!, 56.h);
    } else {
      return Size.fromHeight(56.h);
    }
  }
}
