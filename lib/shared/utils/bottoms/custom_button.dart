import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.leading,
    this.onTap,
    required this.text,
    this.decoration,
    this.colorText,
    this.isLoading = false,
    this.textStyle,
    this.heightH,
    this.padding,
    this.width,
    this.alignment,
    this.colorButton,
    this.borderRadius,
  });

  /// Detault=12
  final BorderRadiusGeometry? borderRadius;
  final Widget? leading;
  final void Function()? onTap;
  final String text;
  final Decoration? decoration;
  final Color? colorText;
  final Color? colorButton;
  final bool isLoading;
  final TextStyle? textStyle;
  final double? heightH;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width,
        height: heightH?.h,
        padding: padding,
        alignment: alignment,
        clipBehavior: Clip.antiAlias,
        decoration:
            decoration ??
            ShapeDecoration(
              color: colorButton ?? Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),

        // ShapeDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment(0.50, -0.00),
        //     end: Alignment(0.50, 1.00),
        //     colors: [const Color(0xFF8924E7), const Color(0xFF6A46F9)],
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        // ),
        child: !isLoading
            ? Text(
                text,
                textAlign: TextAlign.center,
                style:
                    textStyle ??
                    TextStyle(
                      color: colorText ?? Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Golos Text',
                      fontWeight: FontWeight.w500,
                      height: 1.h,
                    ),
              )
            : CupertinoActivityIndicator(color: AppColors.white, radius: 12),
      ),
    );
  }
}
