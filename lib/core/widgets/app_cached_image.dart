import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 200),
    this.fadeOutDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          placeholder ??
          (context, url) => Container(
            width: width,
            height: height,
            color: const Color(0xFFF5F5F5),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF9775FA),
                ),
              ),
            ),
          ),
      errorWidget:
          errorWidget ??
          (context, url, error) => Container(
            width: width,
            height: height,
            color: const Color(0xFFF5F5F5),
            child: Icon(
              Icons.image_not_supported,
              size: 32.sp,
              color: const Color(0xFF8F959E),
            ),
          ),
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
    );

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
