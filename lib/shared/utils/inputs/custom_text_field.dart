import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/shared/constants/app_textstyle.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.readOnly = false,
    this.onTap,
    this.heightH = 24,
    this.textStyle,
    this.hintTextStyle,
    this.keyboardType,
    this.maxLines = 1,
    this.color = const Color(0xffFFFFFF),
    // this.decoration,
    this.isPassword = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.colorBorder = const Color(0xFFDFEAF2),
    this.suffixIconConstraints,
    this.onChanged,
  });

  final bool isPassword;
  final double heightH;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Color color;
  final BorderRadius borderRadius;
  final Color colorBorder;
  final BoxConstraints? suffixIconConstraints;
  // final Decoration? decoration;
  final Function(String text)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    hidePassword = widget.isPassword ? true : false;
    super.initState();
  }

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidePassword,
      obscuringCharacter: '*',
      enableSuggestions: !(widget.isPassword),
      autocorrect: !(widget.isPassword),

      onChanged: widget.onChanged,
      scrollPadding: const EdgeInsets.only(bottom: 200),
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onTap: widget.onTap,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readOnly,
      enableInteractiveSelection: !widget.readOnly,

      decoration: InputDecoration(
        errorMaxLines: 5,
        filled: true,
        fillColor: widget.color,

        constraints: BoxConstraints(minHeight: widget.heightH.h),

        //prefixIconConstraints: BoxConstraints(maxHeight: 0),
        isDense: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.all(0),

        hintText: widget.hintText,
        hintStyle:
            widget.hintTextStyle ??
            GoogleFonts.roboto(
              textStyle: TextStyle(
                color: const Color(0xFF87858F),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.71.h,
              ),
            ),

        //border: UnderlineInputBorder(),

        // border: widget.readOnly
        //     ? OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       )
        //     : OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       ),
        // focusedBorder: widget.readOnly
        //     ? OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       )
        //     : OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       ),

        // enabledBorder: widget.readOnly
        //     ? OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       )
        //     : OutlineInputBorder(
        //         borderRadius: widget.borderRadius,
        //         borderSide: BorderSide(width: 1, color: widget.colorBorder),
        //       ),

        // errorBorder: OutlineInputBorder(
        //   borderRadius: widget.borderRadius,
        //   borderSide: BorderSide(color: const Color(0xFFF83427)),
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: widget.borderRadius,
        //   borderSide: BorderSide(width: 1, color: widget.colorBorder),
        // ),
        //
        //if there is suffix
        //suffixIconConstraints: BoxConstraints(maxHeight: 0),
        // border: UnderlineInputBorder(borderSide: BorderSide()),

        //suffixIconConstraints: widget.suffixIconConstraints,
        // suffixIcon: widget.isPassword
        //     ? GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             hidePassword = !hidePassword;
        //           });
        //         },
        //         child: Icon(
        //           color: Color(0xff262D29).withValues(alpha: 0.6),
        //           hidePassword
        //               ? Icons.visibility_off_outlined
        //               : Icons.visibility_outlined,
        //           size: 18,
        //         ),
        //       )
        //     : widget.suffixIcon,
        //prefixIcon: widget.prefixIcon,
      ),

      style:
          widget.textStyle ??
          AppTextStyle.roboto_def_14_500(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 1.71.h,
          ),
    );
  }
}
