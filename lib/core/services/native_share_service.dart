import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:simple_painter/main.dart';

const _tag = '[NativeShareService]';

class NativeShareService {
  static const MethodChannel _channel = MethodChannel(
    'com.example.app/share_image',
  );

  static Future<void> shareImage({
    required Uint8List bytes,
    required String fileName,
    String message = '',
  }) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(bytes);

      // Invoke the native method
      await _channel.invokeMethod('shareImage', {
        'path': file.path,
        'message': message, // Pass the message to the native side
      });
    } on PlatformException catch (e) {
      logger.e("Failed to share image: '${e.message}'.");
    }
  }
}
