import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:simple_painter/main.dart';

const _tag = '[NativeShareService]';

class NativeShareService {
  static const _channel = MethodChannel('com.example/native_share');

  static Future<void> shareBytesAsFile(
    Uint8List bytes, {
    String? name,
    String? text,
  }) async {
    try {
      final tmp = await getTemporaryDirectory();
      final fileName =
          name ?? 'drawing_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${tmp.path}/$fileName');
      await file.writeAsBytes(bytes, flush: true);
      await _channel.invokeMethod('shareFile', {
        'path': file.path,
        'text': text ?? '',
      });
    } catch (e) {
      logger.e('$_tag, Error sharing Image: $e');
    }
  }
}
