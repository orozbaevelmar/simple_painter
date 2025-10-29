import 'package:dartz/dartz.dart';
import 'package:simple_painter/app/data/authentication/data_sources/remote/auth_remote_data_sources.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/data/authentication/models/register_model.dart';
import 'package:simple_painter/core/extensions/extensions.dart';
import 'package:simple_painter/main.dart';
import 'package:simple_painter/shared/error/exception.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, LoginModel>> register({
    required RegisterModel registerModel,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSources authRemoteDataSources})
    : _authRemoteDataSources = authRemoteDataSources;

  final AuthRemoteDataSources _authRemoteDataSources;

  @override
  Future<Either<Failure, LoginModel>> register({
    required RegisterModel registerModel,
  }) async {
    try {
      final response = await _authRemoteDataSources.register(
        registerModel: registerModel,
      );
      if (response != null) {
        return Right(response);
      } else {
        logger.e('appInfo: Ошибка при получении register');
        return Left(ServerFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      logger.e('appInfo: Ошибка при получении register: $e');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authRemoteDataSources.login(
        email: email,
        password: password,
      );
      if (response != null) {
        return Right(response);
      } else {
        logger.e('appInfo: Ошибка при получении login');
        return Left(ServerFailure());
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      logger.e('appInfo: Ошибка при получении login: $e');
      return Left(ServerFailure());
    }
  }
}
