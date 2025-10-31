import 'dart:async';
import 'dart:io';
import 'package:simple_painter/app/data/storage/data_sources/remote/images_remote_data_sources.dart';
import 'package:simple_painter/app/data/storage/models/image_model.dart';

abstract class ImagesRepository {
  Future<ImageModel> uploadImage({
    required File file,
    required String name,
    required String author,
  });

  Stream<List<ImageModel>> getImagesStream();
}

class ImageRepositoryImpl implements ImagesRepository {
  final ImagesRemoteDataSource imagesRemoteDataSource;
  ImageRepositoryImpl({required this.imagesRemoteDataSource});

  @override
  Future<ImageModel> uploadImage({
    required File file,
    required String name,
    required String author,
  }) {
    return imagesRemoteDataSource.uploadFile(
      file: file,
      name: name,
      author: author,
    );
  }

  @override
  Stream<List<ImageModel>> getImagesStream() {
    return imagesRemoteDataSource.imagesStream();
  }
}
