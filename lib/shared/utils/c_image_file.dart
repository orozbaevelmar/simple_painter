import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CImageFile extends StatelessWidget {
  final File file;
  final double? heightH;
  final double? widthW;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;

  const CImageFile({
    super.key,
    required this.file,
    this.heightH,
    this.widthW,
    this.borderRadius = BorderRadius.zero,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
  });

  const CImageFile.circle({
    super.key,
    required this.file,
    this.heightH,
    this.widthW,
    this.color,
    this.colorBlendMode,
    this.fit = BoxFit.cover,
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

  Image _buildImageNetwork() {
    return Image.file(
      file,
      color: color,
      colorBlendMode: colorBlendMode,
      width: widthW?.h,
      height: heightH?.w,
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
      errorBuilder: (context, error, stackTrace) => Image.asset(
        'assets/images/no_image.jpg',
        fit: fit,
        width: widthW?.w,
        height: heightH?.h,
      ),
    );
  }
}
