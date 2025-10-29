import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:simple_painter/core/services/local_service.dart';
import 'package:simple_painter/shared/api/api_consumer.dart';
import 'package:simple_painter/shared/api/api_status_code.dart';
import 'package:simple_painter/shared/error/exception.dart';
import 'package:simple_painter/shared/utils/error/error_utils.dart';

class DioApiConsumer extends ApiConsumer {
  final Dio dioClient;
  final String baseUrl;

  DioApiConsumer({required this.dioClient, required this.baseUrl}) {
    // Trust all certificates
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (_, __, ___) => true;
      return client;
    };

    // Global Dio options
    dioClient.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) =>
          status! < ApiStatusCodes.internalServerError;

    // Interceptor for auth token and headers
    dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await LocalService.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Token $token';
          }
          final isMultipart = options.extra['isMultipart'] == true;
          options.headers['Accept'] = 'application/json';
          options.headers['Content-Type'] = isMultipart
              ? 'multipart/form-data'
              : 'application/json';
          handler.next(options);
        },
        onError: (DioException error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  @override
  Future<Response> get(
    String endPointPath, {
    dynamic data,
    dynamic query,
    bool isMultipart = false,
    int? timeOut,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    options ??= Options();
    options.extra ??= {};
    options.extra!['isMultipart'] = isMultipart;

    if (timeOut != null) {
      dioClient.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    try {
      return await dioClient.get(
        endPointPath,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
        options: options,
      );
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    } catch (e) {
      log("DioApiConsumer.get: An unexpected error occurred: $e");
      throw UnknownServerException();
    }
  }

  @override
  Future<Response> post(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    bool isMultipart = false,
    void Function(int, int)? progressCallback,
    int? timeOut,
    Options? options,
  }) async {
    options ??= Options();
    options.extra ??= {};
    options.extra!['isMultipart'] = isMultipart;

    if (timeOut != null) {
      dioClient.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    try {
      if (data is FormData) {
        return await dioClient.post(
          endPointPath,
          queryParameters: query is Map<String, dynamic> ? query : null,
          data: data,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: progressCallback,
        );
      } else {
        return await dioClient.post(
          endPointPath,
          queryParameters: query is Map<String, dynamic> ? query : null,
          data: data,
          cancelToken: cancelToken,
          options: options,
        );
      }
    } on DioException catch (error) {
      log("DioException.post: ${error.response?.data}");
      _handleDioError(error);
      rethrow;
    } catch (e) {
      log("DioApiConsumer.post: An unexpected error occurred: $e");
      throw UnknownServerException();
    }
  }

  @override
  Future<Response> put(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    bool isMultipart = false,
    void Function(int, int)? progressCallback,
    int? timeOut,
    Options? options,
  }) async {
    options ??= Options();
    options.extra ??= {};
    options.extra!['isMultipart'] = isMultipart;

    if (timeOut != null) {
      dioClient.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    try {
      if (data is FormData) {
        return await dioClient.put(
          endPointPath,
          queryParameters: query,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: progressCallback,
        );
      } else {
        return await dioClient.put(
          endPointPath,
          queryParameters: query,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      }
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    } catch (e) {
      log("DioApiConsumer.put: An unexpected error occurred: $e");
      throw UnknownServerException();
    }
  }

  @override
  Future<Response> patch(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    bool isMultipart = false,
    void Function(int, int)? progressCallback,
    int? timeOut,
    Options? options,
  }) async {
    options ??= Options();
    options.extra ??= {};
    options.extra!['isMultipart'] = isMultipart;

    if (timeOut != null) {
      dioClient.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    try {
      if (data is FormData) {
        return await dioClient.patch(
          endPointPath,
          queryParameters: query,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: progressCallback,
        );
      } else {
        return await dioClient.patch(
          endPointPath,
          queryParameters: query,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      }
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    } catch (e) {
      log("DioApiConsumer.patch: An unexpected error occurred: $e");
      throw UnknownServerException();
    }
  }

  @override
  Future<Response> delete(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    bool isMultipart = false,
    void Function(int, int)? progressCallback,
    int? timeOut,
    Options? options,
  }) async {
    options ??= Options();
    options.extra ??= {};
    options.extra!['isMultipart'] = isMultipart;

    if (timeOut != null) {
      dioClient.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    try {
      return await dioClient.delete(
        endPointPath,
        queryParameters: query,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    } catch (e) {
      log("DioApiConsumer.delete: An unexpected error occurred: $e");
      throw UnknownServerException();
    }
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException();
      case DioExceptionType.badResponse:
        final response = error.response;
        if (response?.statusCode != null) {
          //final data = jsonDecode(response!.data);
          final data = response!.data;
          switch (response.statusCode) {
            case ApiStatusCodes.badRequest:
              throw ServerException(ErrorUtils.handleApiError(data));
            case ApiStatusCodes.unauthorized:
            case ApiStatusCodes.forbidden:
              throw UnauthorizedException();
            case ApiStatusCodes.notFound:
              throw NotFoundException();
            case ApiStatusCodes.internalServerError:
              throw InternalServerErrorException();
            default:
              throw ServerException(ErrorUtils.handleApiError(data));
          }
        }
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        throw UnknownServerException();
    }
  }
}
