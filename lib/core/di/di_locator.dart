//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:simple_painter/app/data/authentication/data_sources/remote/auth_remote_data_sources.dart';
import 'package:simple_painter/app/data/authentication/repository/auth_repository.dart';
import 'package:simple_painter/app/data/storage/data_sources/remote/images_remote_data_sources.dart';
import 'package:simple_painter/app/data/storage/repository/images_repository.dart';
import 'package:simple_painter/core/network/network_info.dart';
import 'package:simple_painter/core/services/local_service.dart';
import 'package:simple_painter/shared/api/dio_consumer.dart';
import 'package:simple_painter/shared/constants/api_constants.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  _services();
  _repositories();
  _dataSources();
}

void _services() {
  getIt
    ..registerLazySingleton(() => LocalService())
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => InternetConnection())
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: getIt<InternetConnection>()),
    )
    ..registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance)
    ..registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
}

void _repositories() {
  getIt
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ),
    )
    ..registerLazySingleton<ImagesRepository>(
      () => ImageRepositoryImpl(imagesRemoteDataSource: getIt()),
    );
}

void _dataSources() {
  getIt
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(firebaseAuth: getIt<FirebaseAuth>()),
    )
    ..registerLazySingleton<ImagesRemoteDataSource>(
      () => ImagesRemoteDataSourceImpl(
        firebaseStorage: getIt<FirebaseStorage>(),
        firestore: getIt<FirebaseFirestore>(),
      ),
    );
}
