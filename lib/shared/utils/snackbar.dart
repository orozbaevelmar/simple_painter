import 'package:flutter/material.dart';

void showSnackBar1(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
