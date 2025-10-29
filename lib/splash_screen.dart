import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/shared/constants/m_go.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateTo(context);
  }

  void _navigateTo(BuildContext context) {
    Timer(const Duration(seconds: 1), () async {
      Go.pushAndRemoveUntil(context, const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
        body: SizedBox(),
      ),
    );
  }
}
