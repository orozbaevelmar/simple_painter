import 'package:dio/dio.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/data/authentication/models/register_model.dart';
import 'package:simple_painter/main.dart';
import 'package:simple_painter/shared/api/dio_consumer.dart';
import 'package:simple_painter/shared/constants/api_constants.dart';
import 'package:simple_painter/shared/utils/hanlde_response.dart';

const _tag = '[AuthRemoteDataSources]';

abstract class AuthRemoteDataSources {
  Future<LoginModel?> login({required String email, required String password});
  Future<LoginModel?> register({required RegisterModel registerModel});
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  AuthRemoteDataSourcesImpl({required DioApiConsumer dioApiConsumer})
    : _dioApiConsumer = dioApiConsumer;

  final DioApiConsumer _dioApiConsumer;

  @override
  Future<LoginModel?> register({required RegisterModel registerModel}) async {
    logger.d('$_tag, register');

    try {
      final Response response = await _dioApiConsumer.post(
        ApiConstants.register,
        data: registerModel.toJson(),
      );

      return handleApiResponse<LoginModel>(
        response,
        (data) => LoginModel.fromJson(data),
        className: _tag,
        methodName: 'register',
      );
    } on DioException catch (e) {
      logger.e('$_tag, Ошибка сети: ${e.message}');
      return null;
    } catch (e) {
      logger.e('$_tag, Неизвестная ошибка: $e');
      return null;
    }
  }

  // Login
  @override
  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    logger.d('$_tag, login');

    try {
      final Response response = await _dioApiConsumer.post(
        ApiConstants.login,
        data: {"email": email, "password": password},
      );

      return handleApiResponse<LoginModel>(
        response,
        (data) => LoginModel.fromJson(data),
        className: _tag,
        methodName: 'login',
      );
    } on DioException catch (e) {
      logger.e('$_tag, Ошибка сети: ${e.message}');
      return null;
    } catch (e) {
      logger.e('$_tag, Неизвестная ошибка: $e');
      return null;
    }
  }
}
