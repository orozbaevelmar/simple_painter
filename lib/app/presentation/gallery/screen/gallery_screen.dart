import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_painter/app/presentation/authentication/cubit/auth_cubit.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/app/presentation/gallery/cubit/gallery_cubit.dart';
import 'package:simple_painter/app/presentation/gallery/screen/new_photo.dart';
import 'package:simple_painter/app/presentation/gallery/widget/dialog_widget.dart';
import 'package:simple_painter/core/enums/fetch_status.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/shared/constants/m_go.dart';
import 'package:simple_painter/shared/constants/m_picture_url.dart';
import 'package:simple_painter/shared/utils/app_bar.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';
import 'package:simple_painter/shared/utils/snackbar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: _buildbloc(),
          //_buildbloc(),
        ),
      ),
    );
  }

  BlocBuilder<dynamic, dynamic> _buildbloc() {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (context, state) {
        if (state.status == FetchStatus.success) {
          return state.imagesList.isNotEmpty
              ? _buildSuccesfull(state)
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 40.h,
                    ),
                    child: _buildCreateButton(context),
                  ),
                );
        }

        if (state.status == FetchStatus.error) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: _buildCreateButton(context),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildSuccesfull(ImagesState state) {
    return GridView.builder(
      itemCount: state.imagesList.length,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 46.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final model = state.imagesList[index];
        return GestureDetector(
          onTap: () =>
              Go.to(context, NewPhotoScreen(backUnit8list: model.imageBytes)),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: model.imageBytes != null
                ? Image.memory(model.imageBytes!, fit: BoxFit.cover)
                : Image.asset('assets/images/no_image.jpg', fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  CustomButton _buildCreateButton(BuildContext context) {
    return CustomButton(
      onTap: () {
        Go.to(context, NewPhotoScreen());
      },
      text: 'Создать',
      alignment: Alignment.center,
      heightH: 48,
      width: double.infinity,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, -0.00),
          end: Alignment(0.50, 1.00),
          colors: AppColors.grad1,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      titleText: 'Галерея',
      leading: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == FetchStatus.success) {
            Go.pushAndRemoveUntil(context, LoginScreen());
          } else if (state.status == FetchStatus.error) {
            showSnackBar1(context, state.error ?? 'Error');
          }
        },
        child: GestureDetector(
          onTap: () {
            DialogWidget.show(
              context,
              title: "Выйти из аккаунта?",
              description: 'Чтобы подтвердить нажмите на кнопку "Подтвердить"',
              onConfirmTap: () async {
                context.read<AuthCubit>().logOut();
              },
            );
          },
          child: SvgPicture.asset(
            'assets/icons/logout.svg',
            height: 24,
            width: 24,
          ),
        ),
      ),
      action: BlocBuilder<ImagesCubit, ImagesState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => Go.to(context, NewPhotoScreen()),
            child: SvgPicture.asset(
              'assets/icons/roll.svg',
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                state.status == FetchStatus.success &&
                        state.imagesList.isNotEmpty
                    ? Colors.white
                    : Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
          );
        },
      ),
    );
  }
}
