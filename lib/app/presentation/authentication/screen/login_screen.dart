import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/presentation/authentication/cubit/auth_cubit.dart';
import 'package:simple_painter/app/presentation/authentication/widget/build_text_form_field.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/app/presentation/gallery/screen/gallery_screen.dart';
import 'package:simple_painter/core/enums/fetch_status.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/app/presentation/authentication/screen/register_screen.dart';
import 'package:simple_painter/shared/constants/app_textstyle.dart';
import 'package:simple_painter/shared/constants/m_go.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';
import 'package:simple_painter/shared/utils/snackbar.dart';
import 'package:simple_painter/shared/validatiors/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailCtrl.dispose();
    _password.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void onTapLogin() {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    context.read<AuthCubit>().login(
      loginModel: LoginModel(email: _emailCtrl.text, password: _password.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          'Вход',
                          style: GoogleFonts.pressStart2p(
                            textStyle: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontFamily: 'Press Start 2P',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        20.verticalSpace,

                        BuildTextFormField(
                          controller: _emailCtrl,
                          title: 'e-mail',
                          hintText: 'Введите электронную почту',
                          validator: validateEmail,
                        ),
                        20.verticalSpace,
                        BuildTextFormField(
                          validator: validatePassword,
                          controller: _password,
                          title: 'Подтверждение пароля',
                          hintText: 'Введите пароль',
                          isPassword: true,
                        ),

                        Spacer(),
                        20.verticalSpace,
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state.status == FetchStatus.success) {
                              Go.pushAndRemoveUntil(context, GalleryScreen());
                            } else if (state.status == FetchStatus.error) {
                              showSnackBar1(context, state.error ?? 'Error');
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              isLoading: state.status == FetchStatus.loading,
                              onTap: onTapLogin,
                              text: 'Войти',
                              alignment: Alignment.center,
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
                            );
                          },
                        ),
                        19.verticalSpace,
                        CustomButton(
                          onTap: () => Go.to(context, RegisterScreen()),
                          text: 'Регистрация',
                          alignment: Alignment.center,
                          textStyle: AppTextStyle.roboto_def_14_500(
                            fontSize: 17,
                            height: 1.41,
                          ),
                          heightH: 48,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: AppColors.white,
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
      ),
    );
  }
}
