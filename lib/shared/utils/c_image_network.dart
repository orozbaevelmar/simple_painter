import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/shared/constants/api_constants.dart';

class CImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? heightH;
  final double? widthW;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final Widget? noImage;

  const CImageNetwork({
    super.key,
    required this.imageUrl,
    this.heightH,
    this.widthW,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
    this.noImage,
  });

  CImageNetwork.chat({
    super.key,
    required this.imageUrl,
    this.heightH,
    this.widthW,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
  }) : noImage = Icon(
         Icons.account_circle,
         color: AppColors.black35,
         size: widthW,
       );

  const CImageNetwork.circle({
    super.key,
    required this.imageUrl,
    this.heightH,
    this.widthW,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
    this.noImage,
  }) : borderRadius = null;

  @override
  Widget build(BuildContext context) {
    return borderRadius != null
        ? ClipRRect(borderRadius: borderRadius!, child: _buildImageNetwork())
        : Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: _buildImageNetwork(),
          );
  }

  Widget _buildImageNetwork() {
    return imageUrl.startsWith(ApiConstants.https)
        ? Image.network(
            imageUrl,
            color: color,
            colorBlendMode: colorBlendMode,
            width: widthW?.w,
            height: heightH?.h,
            fit: fit,

            // loadingBuilder: (BuildContext context, Widget child,
            //     ImageChunkEvent? loadingProgress) {
            //   if (loadingProgress == null) {
            //     return child;
            //   }
            //   return Center(
            //     child: CircularProgressIndicator(
            //       value: loadingProgress.expectedTotalBytes != null
            //           ? loadingProgress.cumulativeBytesLoaded /
            //               loadingProgress.expectedTotalBytes!
            //           : null,
            //     ),
            //   );
            // },
            errorBuilder: (context, error, stackTrace) =>
                noImage ??
                Image.asset(
                  'assets/images/no_image.jpg',
                  fit: fit,
                  width: widthW?.w,
                  height: heightH?.h,
                ),
          )
        : noImage ??
              Image.asset(
                'assets/images/no_image.jpg',
                fit: fit,
                width: widthW?.w,
                height: heightH?.h,
              );
  }
}
