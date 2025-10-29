import 'package:flutter/material.dart';
import 'package:simple_painter/shared/utils/bottoms/custom_button.dart';

class StrokeWidthPickerDialog extends StatelessWidget {
  final double strokeWidth;

  const StrokeWidthPickerDialog({super.key, required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    double returnableStrokeWidth = strokeWidth;

    return StatefulBuilder(
      builder: (context, setStateInDialog) {
        return AlertDialog(
          title: const Text("Выберите размер обводки(штриха"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Slider(
                  value: returnableStrokeWidth,
                  min: 1.0,
                  max: 20.0,
                  divisions: 19,
                  label: returnableStrokeWidth.round().toString(),
                  onChanged: (double value) {
                    setStateInDialog(() {
                      returnableStrokeWidth = value;
                    });
                  },
                ),
                Text(
                  'Размер обводки(штриха): ${returnableStrokeWidth.round()}',
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              text: 'Отмена',
              onTap: () => Navigator.pop(context),
              colorButton: Colors.white,
              colorText: Colors.black,

              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            CustomButton(
              text: 'Выбрать',
              onTap: () => Navigator.pop(context, returnableStrokeWidth),
              colorButton: Colors.green,
              colorText: Colors.white,

              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
          ],
        );
      },
    );
  }
}
