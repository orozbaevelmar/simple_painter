import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:simple_painter/main.dart';
import 'package:simple_painter/shared/constants/print_beautiful.dart';
import 'package:simple_painter/shared/error/exception.dart';

/// A generic method to handle API responses.
Future<T> handleApiResponse<T>(
  Response response,
  T Function(dynamic data) parseSuccess, {
  String? className,
  String? methodName,
  Map<String, dynamic>? args,
  bool? isString = false,
  // if you don't need response.data, just want to check response.statusCode == 200
  bool? ignoreBody = false,
  String Function(dynamic data)? parseError,
}) async {
  logger.d(
    'handleApiResponse, StatusCode=${response.statusCode}, class: $className, method: $methodName, response: $response, args: $args',
  );

  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 204) {
    if (ignoreBody == true) {
      return parseSuccess(null);
    }
    if (isString == true) {
      return response.data as T;
    }

    logBeautiful(jsonDecode(response.data));
    return parseSuccess(jsonDecode(response.data));
  } else {
    //print(object)
    if (parseError != null) {
      final String str = parseError(jsonDecode(response.data));
      throw ServerException(str);
    }

    String errorMessage = response.data;

    //String errorMessage = (jsonDecode(response.data))['detail'];

    // switch (response.statusCode) {
    //   case 404:
    //     errorMessage = 'error404';
    //     break;
    //   case 502:
    //     errorMessage = 'error502';
    //     break;
    //   default:
    //     errorMessage = ErrorUtils.handleApiError(response.data);
    // }

    logger.e(
      'handleApiResponse ERROR, StatusCode:=${response.statusCode}, method: $methodName, class: $className, message: $errorMessage, response: $response',
    );

    throw ServerException(errorMessage);
  }
}

Future<T> handleApiResponseDEBUG<T>(
  Response response,
  T Function(dynamic data) parseSuccess, {
  String? className,
  String? methodName,
  Map<String, dynamic>? args,
  bool? isString = false,
  // if you don't need response.data, just want to check response.statusCode == 200
  bool? ignoreBody = false,
}) async {
  log(response.toString());

  logger.d(
    'handleApiResponseDEBUG, method: $methodName, response: $response, class: $className, args: $args',
  );
  parseSuccess(jsonDecode(response.data));
  //String errorMessage = response.data;
  //String errorMessage1 = (jsonDecode(response.data));
  //String errorMessage = (jsonDecode(response.data))['detail'];

  logger.e(
    'handleApiResponseDEBUG ERROR, StatusCode: ${response.statusCode}, message:  errorMessage1, response: $response',
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    logger.d(
      'STATUSCODE=200, IT IS HANDLE_API_RESPONSE_DEBUG, change it to handleApiResponse in = method: $methodName, class: $className',
    );
    throw Exception(
      'IT IS HANDLE_API_RESPONSE_DEBUG, STATUSCODE=200 change it to handleApiResponse in = method: $methodName, class: $className',
    );
  }
  return parseSuccess(jsonDecode(response.data));
}
