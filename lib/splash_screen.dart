import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_painter/app/presentation/authentication/cubit/auth_cubit.dart';
import 'package:simple_painter/app/presentation/authentication/screen/login_screen.dart';
import 'package:simple_painter/app/presentation/build_backgrodund.dart';
import 'package:simple_painter/app/presentation/gallery/screen/gallery_screen.dart';
import 'package:simple_painter/shared/constants/m_go.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<AuthCubit>().isLoggedIn();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      User? user = FirebaseAuth.instance.currentUser;
      print('--123');
      print(user);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => GalleryScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
        body: LoginScreen(),

        /* StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data != null) {
              Go.pushAndRemoveUntil(context, GalleryScreen());
              return GalleryScreen();
            } else {
              return LoginScreen();
            }
          },
        ) */
      ),
    );
  }
}
