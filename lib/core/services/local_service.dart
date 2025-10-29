import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_painter/main.dart';

const _tag = '[LocalService]';

class LocalService {
  static Future<String?> getToken() async {
    try {
      final box = await Hive.openBox('tokenModel');
      final token = box.get('token');

      if (token == null) {
        logger.d('$_tag [getToken], No token found');
        return null;
      }

      return token as String;
    } catch (e) {
      logger.e('$_tag [getToken], Error retrieving token: $e');
      return null;
    }
  }

  static Future<void> setToken({required String token}) async {
    try {
      final box = await Hive.openBox('tokenModel');
      await box.put('token', token);
      logger.d('$_tag [setToken], Token saved successfully');
    } catch (e) {
      logger.e('$_tag [setToken], Error saving token: $e');
    }
  }

  static Future<void> clearToken() async {
    try {
      final box = await Hive.openBox('tokenModel');
      await box.delete('token');
      logger.d('$_tag [clearToken], Token cleared');
    } catch (e) {
      logger.e('$_tag [clearToken], Error clearing token: $e');
    }
  }

  // static Future<Locale> getLanguage() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final localeCode = prefs.getString('locale');

  //     if (localeCode == null) {
  //       // Получаем язык телефона
  //       Locale systemLocale = PlatformDispatcher.instance.locale;
  //       debugPrint('$_tag [getLanguage], No language found. Using system locale: ${systemLocale.languageCode}');
  //       return systemLocale;
  //     }

  //     return Locale(localeCode);
  //   } catch (e) {
  //     debugPrint('$_tag [getLanguage], Error retrieving language: $e');
  //     return PlatformDispatcher.instance.locale; // На случай ошибки используем язык устройства
  //   }
  // }

  // static Future<void> setLanguage({required Locale locale}) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('locale', locale.languageCode);
  //     debugPrint('$_tag [setLanguage], Language saved successfully: ${locale.languageCode}');
  //   } catch (e) {
  //     debugPrint('$_tag [setLanguage], Error saving language: $e');
  //   }
  // }
}
