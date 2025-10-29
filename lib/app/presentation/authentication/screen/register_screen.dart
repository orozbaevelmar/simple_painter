import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_painter/app/presentation/authentication/widget/build_text_form_field.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/shared/constants/app_colors.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/shared/constants/app_textstyle.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';
import 'package:simple_painter/shared/validatiors/validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isReady = false;

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _password1 = TextEditingController();
  final _password2 = TextEditingController();

  void _isAllReadyMethod() {
    _isReady =
        _nameCtrl.text.isNotEmpty &&
        _emailCtrl.text.isNotEmpty &&
        _password1.text.isNotEmpty &&
        _password2.text.isNotEmpty;
    setState(() {
      _isReady;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _password1.dispose();
    _password2.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void onTapRegister() {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    // context
    //     .read<AuthenticationCubit>()
    //     .resetpasswordByCode(
    //       email: state.verificationModel!.email,
    //       code: state.verificationModel!.code!,
    //       newPassword: _password1Ctl.text,
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
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
                          'Регистрация',
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
                          validator: validateName,
                          title: 'Имя',
                          hintText: 'Введите ваше имя',
                          controller: _nameCtrl,
                          onChanged: (text) => _isAllReadyMethod(),
                        ),
                        20.verticalSpace,
                        BuildTextFormField(
                          validator: validateEmail,
                          title: 'e-mail',
                          hintText: 'Введите электронную почту',
                          controller: _emailCtrl,
                          onChanged: (text) => _isAllReadyMethod(),
                        ),
                        20.verticalSpace,
                        BuildTextFormField(
                          validator: validatePassword,
                          title: 'Пароль',
                          hintText: '8-16 символов',
                          controller: _password1,
                          isPassword: true,

                          onChanged: (text) => _isAllReadyMethod(),
                        ),
                        20.verticalSpace,
                        BuildTextFormField(
                          validator: (repeatedPassword) =>
                              validatePasswordConfirmation(
                                repeatedPassword: repeatedPassword,
                                password: _password1.text,
                              ),
                          title: 'Подтверждение пароля',
                          hintText: '8-16 символов',
                          controller: _password2,
                          isPassword: true,
                          onChanged: (text) => _isAllReadyMethod(),
                        ),

                        Spacer(),
                        20.verticalSpace,
                        CustomButton(
                          onTap: _isReady ? onTapRegister : null,
                          text: 'Зарегистрироваться',

                          textStyle: AppTextStyle.roboto_def_14_500(
                            fontSize: 17,
                            height: 1.41,
                            color: _isReady
                                ? AppColors.white
                                : AppColors.greyDark,
                          ),
                          heightH: 48,
                          width: double.infinity,
                          decoration: _isReady
                              ? ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.50, -0.00),
                                    end: Alignment(0.50, 1.00),
                                    colors: AppColors.grad1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                              : ShapeDecoration(
                                  color: AppColors.grey,
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
