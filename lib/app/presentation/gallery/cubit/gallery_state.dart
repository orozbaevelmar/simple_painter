part of 'gallery_cubit.dart';

class ImagesState extends Equatable {
  const ImagesState({
    this.status = FetchStatus.initial,
    this.imagesList = const [],
    this.error,
    this.loadingMore,
    this.loadMoreError,
  });

  final FetchStatus status;
  final List<ImageModel> imagesList;
  final String? error;
  final LoadingMore? loadingMore;
  final LoadMoreError? loadMoreError;

  @override
  List<Object?> get props => [
    status,
    imagesList,
    error,
    loadingMore,
    loadMoreError,
  ];

  ImagesState copyWith({
    FetchStatus? status,
    List<ImageModel>? imagesList,
    String? error,
    LoadingMore? loadingMore,
    LoadMoreError? loadMoreError,
  }) {
    return ImagesState(
      status: status ?? this.status,
      imagesList: imagesList ?? this.imagesList,
      error: error ?? this.error,
      loadingMore: loadingMore, //?? this.loadingMore,
      loadMoreError: loadMoreError, //?? this.loadMoreError,
    );
  }
}
