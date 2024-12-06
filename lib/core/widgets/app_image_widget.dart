import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_shimmer_widgets.dart';

class AppImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? borderRadius;

  const AppImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the URL is a local asset or a network image
    final bool isAssetImage =
        !imageUrl.startsWith('http') && !imageUrl.startsWith('https');

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
      child: newMethod(isAssetImage),
    );
  }

  Widget newMethod(bool isAssetImage) {
    if (isAssetImage) {
      return Image.asset(
        imageUrl,
        height: height ?? 120,
        width: width ?? 120,
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: height ?? 120,
        width: width ?? 120,
        placeholder: (context, url) => const RectangleShimmerWidget(),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      );
    }
  }
}
