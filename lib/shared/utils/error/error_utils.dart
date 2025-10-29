import 'dart:convert';
import 'dart:developer';
import 'package:simple_painter/main.dart';

const _tag = '[ErrorUtils]';

class ErrorUtils {
  // Method to extract and format error details
  static String handleApiError(dynamic responseData) {
    logger.d('$_tag, handleApiError');
    // Ensure responseData is parsed correctly
    final Map<String, dynamic> responseMap = responseData is String
        ? jsonDecode(responseData)
        : responseData as Map<String, dynamic>;

    logger.d('$_tag, responseData ["message"] = ${responseMap["message"]}');

    final String errorMessage =
        responseMap["message"] ?? "unknownErrorTryAgain";

    final dynamic details = responseMap["details"];

    if (details == null) {
      return errorMessage;
    }
    logger.d('$_tag, responseData ["details"] = $details');
    String detailedMessage = '';

    if (details is String) {
      log("DETAILS ON ERROR[STR]: $details");
      detailedMessage = details;
    } else if (details is Map<String, dynamic>) {
      log("DETAILS ON ERROR[MAP]: $details");
      if (details.containsKey("error") &&
          (details['error'] as String).contains('Chat not found')) {
        return '';
      }
      final errorMessages = details.entries
          .where(
            (entry) => entry.value is List && (entry.value as List).isNotEmpty,
          )
          .map((entry) => (entry.value as List).join(", "))
          .join("\n");

      detailedMessage = errorMessages;
    }

    logger.d('$_tag, detailedMessage = $detailedMessage');

    return ("$errorMessage.${detailedMessage.isNotEmpty ? ',\n$detailedMessage' : ''}");
  }
}
