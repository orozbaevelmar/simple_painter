import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_painter/core/services/local_service.dart';
import 'package:simple_painter/shared/api/dio_consumer.dart';
import 'package:simple_painter/shared/constants/api_constants.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  _services();
  // _repositories();
  // _dataSources();
  await getIt.allReady();
}

void _services() {
  getIt
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(
      () => DioApiConsumer(
        baseUrl: ApiConstants.baseUrlWithPath,
        dioClient: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton(() => LocalService());
}

// void _repositories() {
//   getIt..registerLazySingleton<AuthRepository>(
//     () => (
//       authRemoteDataSources: getIt.get<AuthRemoteDataSourcesImpl>(),
//     ),
//   );
// }

// void _dataSources() {
//   getIt..registerLazySingleton(
//     () =>
//         AuthRemoteDataSourcesImpl(dioApiConsumer: getIt.get<DioApiConsumer>()),
//   );
// }
