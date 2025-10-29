import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  final Widget child;
  const BuildBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/back_gradient.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: -20,
          top: 0,
          right: -10,
          child: Image.asset('assets/images/pattern.png'),
        ),
        child,
      ],
    );
  }
}
