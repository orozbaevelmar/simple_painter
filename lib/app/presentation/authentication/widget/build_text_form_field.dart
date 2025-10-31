import 'package:flutter/material.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/shared/constants/app_boxshadows.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/shared/constants/app_textstyle.dart';
import 'package:simple_painter/shared/utils/inputs/custom_text_field.dart';

class BuildTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Function(String text)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  const BuildTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.onChanged,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
            AppColors.bg.withValues(alpha: 0.25),
            BlendMode.dstATop,
          ),
          image: AssetImage('assets/images/back_gradient.png'),
        ),
        //color: AppColors.bg,
        shadows: AppBoxShadows.backgroundBlurInnerShadow,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: const Color(0xFF87858F)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            title,
            style: AppTextStyle.roboto_def_14_500(
              color: Color(0xFF87858F),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomTextFormField(
            onChanged: onChanged,
            controller: controller,
            isPassword: isPassword,
            heightH: 24,
            color: Colors.transparent,
            validator: validator,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
