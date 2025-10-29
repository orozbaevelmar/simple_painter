class LoadingMore {
  final bool? firstLoadIndicator;
  final bool? secLoadIndicator;
  final String message;
  LoadingMore({
    required this.message,
    this.firstLoadIndicator,
    this.secLoadIndicator,
  });
}

class LoadMoreError {
  final String message;
  LoadMoreError({required this.message});
}
