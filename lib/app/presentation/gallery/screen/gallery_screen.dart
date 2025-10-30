import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/app/presentation/gallery/screen/new_photo.dart';
import 'package:simple_painter/app/presentation/gallery/widget/dialog_widget.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/shared/constants/m_go.dart';
import 'package:simple_painter/shared/utils/app_bar.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        //AppBar(backgroundColor: Colors.transparent, elevation: 0, ,),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),

                      100.verticalSpace,

                      20.verticalSpace,
                      CustomButton(
                        onTap: () {
                          Go.to(context, NewPhotoScreen());
                        },
                        text: 'Создать',
                        heightH: 48,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.50, -0.00),
                            end: Alignment(0.50, 1.00),
                            colors: AppColors.grad1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      titleText: 'Галерея',
      leading: GestureDetector(
        onTap: () {
          DialogWidget.show(
            context,
            title: "Выйти из аккаунта?",
            description: 'Чтобы подтвердить нажмите на кнопку "Подтвердить"',
            onConfirmTap: () async {
              Go.pushAndRemoveUntil(context, LoginScreen());
            },
          );
        },
        child: SvgPicture.asset(
          'assets/icons/logout.svg',
          height: 24,
          width: 24,
        ),
      ),
      action: SvgPicture.asset(
        'assets/icons/logout.svg',
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
      ),
    );
  }
}
