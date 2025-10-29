import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.onConfirmTap,
    required this.description,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required void Function()? onConfirmTap,
    required String description,
  }) {
    return showDialog(
      barrierColor: Color(0xff202224).withValues(alpha: 0.5),
      context: context,
      barrierDismissible: true,
      builder: (_) => DialogWidget(
        title: title,
        onConfirmTap: onConfirmTap,
        description: description,
      ),
    );
  }

  final String title;
  final String description;
  final void Function()? onConfirmTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: _buildShowMethod(context),
      ),
    );
  }

  Widget _buildShowMethod(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF202020),
            fontSize: 20,
            fontFamily: 'Golos Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpace,
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF202020),
            fontSize: 14,
            fontFamily: 'Golos Text',
            fontWeight: FontWeight.w400,
          ),
        ),
        24.verticalSpace,
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 48.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppColors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C343D48),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Отмена',
                      style: TextStyle(
                        color: const Color(0xFF24A1E3),
                        fontSize: 16,
                        fontFamily: 'Golos Text',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            25.horizontalSpace,
            Expanded(
              child: GestureDetector(
                onTap: onConfirmTap,
                child: Container(
                  height: 48.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0C343D48),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Подвердить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Golos Text',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
