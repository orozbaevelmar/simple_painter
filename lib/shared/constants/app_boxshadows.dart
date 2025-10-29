import 'package:flutter/material.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';

class AppBoxShadows {
  static final List<BoxShadow> backgroundBlurInnerShadow = [
    // BoxShadow(
    //   color: AppColors.bg,

    //   blurStyle: BlurStyle.inner,
    // ),

    // BoxShadow(blurRadius: 100, blurStyle: BlurStyle.inner),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(0, 1),
      spreadRadius: 0,
      blurRadius: 40,

      color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      spreadRadius: 0,
      blurRadius: 40,
      color: AppColors.bg,
      //color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
    ),

    // BoxShadow(
    //   blurStyle: BlurStyle.inner,
    //   offset: Offset(0, 1),
    //   spreadRadius: 0,
    //   blurRadius: 40,
    //   color: AppColors.bg,
    //   //color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
    // ),
    // BoxShadow(
    //   blurStyle: BlurStyle.inner,
    //   offset: Offset(0, 1),
    //   spreadRadius: 0,
    //   blurRadius: 40,
    //   color: Colors.red,
    //   //color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
    // ),
  ];

  // static final BoxShadow backgoundColor = BoxShadow(
  //     blurStyle: BlurStyle.inner,
  //     spreadRadius: 0,
  //     blurRadius: 40,
  //     color: AppColors.bg,
  //     //color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
  //   ),

  static final BoxShadow innerShadowTop = BoxShadow(
    blurStyle: BlurStyle.inner,
    offset: Offset(0, 1),
    blurRadius: 40,
    spreadRadius: 0,
    color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
  );

  static final BoxShadow innerShadowBottom = BoxShadow(
    blurStyle: BlurStyle.inner,
    offset: Offset(0, -82),
    blurRadius: 68,
    spreadRadius: -64,
    color: Color(0xFF604490).withValues(alpha: 0.3),
  );

  static final BoxShadow backgroundColor = BoxShadow(
    blurStyle: BlurStyle.inner,
    spreadRadius: 0,
    blurRadius: 40,
    color: const Color(0xFFC4C4C4).withValues(alpha: 0.01),
  );
}
