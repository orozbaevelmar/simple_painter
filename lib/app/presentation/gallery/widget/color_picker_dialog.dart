import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';

class ColorPickerDialog extends StatelessWidget {
  final Color currentColor;

  const ColorPickerDialog({super.key, required this.currentColor});

  @override
  Widget build(BuildContext context) {
    //Color returnableColor = currentColor;

    return AlertDialog(
      backgroundColor: const Color(0xFF7C7C7D),
      scrollable: true,
      elevation: 5,

      shadowColor: Color(0x0C0C0C0D),

      content: BlockPicker(
        pickerColor: currentColor,
        onColorChanged: (selectedColor) {
          Navigator.pop(context, selectedColor);
        },
      ),
    );
  }
}
