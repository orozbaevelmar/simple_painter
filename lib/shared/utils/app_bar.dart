import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_painter/shared/constants/app_boxshadows.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/shared/constants/app_textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool centerTitle;

  final VoidCallback? onTapBackButton;
  final Widget? action;
  final Widget? leading;
  const CustomAppBar({
    super.key,
    required this.titleText,

    this.centerTitle = true,
    this.action,
    this.onTapBackButton,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return _buildAppBar1();
  }

  PreferredSizeWidget _buildAppBar1() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: ShapeDecoration(
          // shadows: [
          //   // BoxShadow(
          //   //   blurStyle: BlurStyle.inner,
          //   //   spreadRadius: 0,
          //   //   blurRadius: 40,
          //   //   color: const Color(0xFFC4C4C403).withValues(alpha: 0.01),
          //   // ),
          //   //BoxShadow(blurRadius: 100),
          //   //AppBoxShadows.innerShadowTop,
          //   AppBoxShadows.innerShadowBottom,
          //   AppBoxShadows.backgroundColor,
          // ],
          shadows: [
            //AppBoxShadows

            // BoxShadow(
            //   blurStyle: BlurStyle.inner,
            //   spreadRadius: 0,
            //   blurRadius: 40,
            //   color: const Color(0xFFC4C4C4).withValues(alpha: 0.01),
            // ),

            // BoxShadow(
            //   blurStyle: BlurStyle.inner,
            //   offset: Offset(0, -82),
            //   blurRadius: 68,
            //   spreadRadius: -64,
            //   color: Color(0xFF604490).withValues(alpha: 0.3),
            // ),
            // BoxShadow(
            //   blurStyle: BlurStyle.inner,
            //   offset: Offset(0, -82),
            //   //blurRadius: 68,
            //   //spreadRadius: -64,
            //   color: Color(0xFF604490).withValues(alpha: 0.3),
            // ),
            BoxShadow(
              blurStyle: BlurStyle.inner,
              offset: Offset(0, 1),
              blurRadius: 40,
              spreadRadius: 0,
              color: Color(0xFFE3E3E3).withValues(alpha: 0.2),
            ),
            BoxShadow(
              blurStyle: BlurStyle.inner,
              spreadRadius: 0,
              offset: Offset(0, -82),

              blurRadius: 68,

              color: Color(0xFFC4C4C4).withValues(alpha: 0.01),
            ),
            BoxShadow(
              blurStyle: BlurStyle.inner,
              spreadRadius: 0,
              offset: Offset(0, 0),
              blurRadius: 68,
              color: Color(0xFF604490).withValues(alpha: 0.3),
            ),

            BoxShadow(blurRadius: 100),
          ],

          color: const Color(0xFFC4C4C4).withValues(alpha: 0.01),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              if (leading != null) leading!,

              Text(
                titleText,
                style: AppTextStyle.roboto_def_14_500(
                  color: const Color(0xFFEEEEEE),
                  fontSize: 17,
                  height: 1.41,
                ),
              ),

              if (action != null) action!,
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      titleSpacing: 0,

      actionsPadding: EdgeInsets.only(right: 20),
      //leading: leading,
      //actions: action,
      //shadowColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.black),
      title: Container(
        decoration: ShapeDecoration(
          shadows: AppBoxShadows.backgroundBlurInnerShadow,
          color: const Color(0x02C4C4C4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Галерея',
                style: AppTextStyle.roboto_def_14_500(
                  color: const Color(0xFFEEEEEE),
                  fontSize: 17,
                  height: 1.41,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
