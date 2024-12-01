import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      this.height,
      this.width,
      this.radius = 0,
      required this.imageUrl,
      this.withBorder = false,
      this.borderColor = AppColors.white,
      this.placeholder,
      this.errorWidget});

  final double? height;
  final double? width;
  final double radius;
  final String imageUrl;
  final bool withBorder;
  final Color borderColor;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: withBorder ? EdgeInsets.all(3.w) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(radius.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: placeholder ?? (context, url) => const CircularProgressIndicator.adaptive(),
          errorWidget: errorWidget ??
              (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.red,
                  ),
        ),
      ),
    );
  }
}
