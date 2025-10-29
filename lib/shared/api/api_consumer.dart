import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> post(
    String endPointPath, {
    dynamic data,
    dynamic query,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> put(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> patch(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> delete(
    String endPointPath, {
    dynamic data,
    dynamic query,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    int? timeOut,
    bool isMultipart = false,
  });
}
