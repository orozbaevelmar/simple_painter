import 'package:flutter/material.dart';

class Go {
  static to(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }

  static Future<bool?> toWithResult(context, destination) async {
    // Don't Forget
    // Navigator.pop(context, true);

    return await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );

    // final success = await Navigator.push<bool>(
    //   context,
    //   MaterialPageRoute(
    //       builder: (_) => const LoginScreen()),
    // );
  }

  // static Future<bool?> pushReplacement1(context, destination) async {
  //   // Don't Forget
  //   // Navigator.pop(context, true);

  //   Navigator.of(context, rootNavigator: true).pushReplacement<bool>(
  //     MaterialPageRoute(builder: (_) => destination),
  //   );

  //   // final success = await Navigator.push<bool>(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //       builder: (_) => const LoginScreen()),
  //   // );
  // }

  static pushAndRemoveUntil(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
          (route) => false,
        );
      });
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
        (route) => false,
      );
    }
  }

  static replace(context, destination, {bool lazy = false}) {
    if (lazy) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => destination,
        ),
      );
    }
  }
}
