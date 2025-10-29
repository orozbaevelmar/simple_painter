import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';

class AppTextStyle {
  static roboto_def_14_500({
    Color color = AppColors.black,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? height,
  }) => GoogleFonts.roboto(
    textStyle: TextStyle(
      color: color,
      fontSize: fontSize,

      fontWeight: fontWeight,
      height: height,
    ),
  );
}
