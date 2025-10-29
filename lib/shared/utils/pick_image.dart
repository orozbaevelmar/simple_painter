import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_painter/shared/utils/snackbar.dart';

Future<File?> pickImage(BuildContext context, ImageSource source) async {
  try {
    final XFile? image = await ImagePicker().pickImage(source: source);

    if (image != null) {
      return File(image.path);
      //imagePath = image.path;
      // context
      //     .read<ProfileBloc>()
      //     .add(ProfileChangeImageEvent(imagePath: image.path));
    } else {
      return null;
    }
  } catch (error) {
    if (context.mounted) {
      await _askPermission(context);
    }
    return null;
  }
}

Future<void> _askPermission(BuildContext context) async {
  PermissionStatus status = await Permission.photos.status;
  if (status.isDenied) {
    if (context.mounted) {
      // openAppSettings();
      // The user permanently denied the permission
      // You can open the Settings app to manually grant the permission
      _ShowDialog.showDialogSetting(
        context: context,
        title: 'Разрешение отклонено',
        content:
            'Вы можете открыть приложение "Настройки", чтобы вручную предоставить разрешение для приложения на доступ к галерее.',
        onTapYes: () => openAppSettings(),
        yesButtonText: 'Перейти в настройки',
      );
    }
  } else {
    if (context.mounted) {
      showSnackBar1(context, 'Что-то пошло не так');
    }
  }
  /* ShowDialog.showDialogSetting(
      context: context,
      title: 'Доступ запрещен',
      content: 'Пожалуйста, предоставьте разрешение на доступ к галерее.',
      onTapYes: () => Permission.photos.request(),
      yesButtonText: 'Предоставить разрешение',
    ); */
}

class _ShowDialog {
  static Future<bool?> showDialogSetting({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onTapYes,
    required String yesButtonText,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отменить'),
            ),
            TextButton(onPressed: onTapYes, child: Text(yesButtonText)),
          ],
        );
      },
    );
  }
}
