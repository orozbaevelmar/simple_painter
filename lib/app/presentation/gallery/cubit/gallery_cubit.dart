import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_painter/app/data/storage/models/image_model.dart';
import 'package:simple_painter/app/data/storage/repository/images_repository.dart';
import 'package:simple_painter/core/di/di_locator.dart';
import 'package:simple_painter/core/enums/fetch_status.dart';
import 'package:simple_painter/shared/load_more/load_more.dart';

part 'gallery_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final ImagesRepository _imagesRepository = getIt<ImagesRepository>();

  ImagesCubit() : super(ImagesState()) {
    _subscribe();
  }

  void _subscribe() {
    emit(state.copyWith(status: FetchStatus.loading));
    _imagesRepository.getImagesStream().listen(
      (list) {
        emit(state.copyWith(imagesList: list, status: FetchStatus.success));
      },
      onError: (e) {
        emit(state.copyWith(error: e.toString(), status: FetchStatus.error));
      },
    );
  }

  Future<void> upload(File file, String name, String author) async {
    emit(state.copyWith(status: FetchStatus.loading));
    try {
      await _imagesRepository.uploadImage(
        file: file,
        name: name,
        author: author,
      );
      emit(state.copyWith(status: FetchStatus.success));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: FetchStatus.error));
    }
  }
}
