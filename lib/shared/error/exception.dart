import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super(message ?? "tryAgain");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message ?? "badRequest");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message ?? "unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(message ?? "requestInfoNotFound");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message ?? "conflictError");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
    : super(message ?? "internalServerError");
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message])
    : super(message ?? "internetConnectionError");
}

class LaunchUrlException extends ServerException {
  const LaunchUrlException([message]) : super(message ?? "noInternet");
}

class UnknownServerException extends ServerException {
  const UnknownServerException([message])
    : super(message ?? "unknownErrorTryAgain");
}

class CacheException extends Equatable implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class TokensException extends Equatable implements Exception {
  final String? message;

  const TokensException([this.message]);

  @override
  List<Object?> get props => [message];
}

class OfflineException extends Equatable implements Exception {
  final String? message;

  const OfflineException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class WeekPassException extends Equatable implements Exception {
  final String? message;

  const WeekPassException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class ExistedAccountException extends Equatable implements Exception {
  final String? message;

  const ExistedAccountException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class NoUserException extends Equatable implements Exception {
  final String? message;

  const NoUserException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class WrongPasswordException extends Equatable implements Exception {
  final String? message;

  const WrongPasswordException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class TooManyRequestsException extends Equatable implements Exception {
  final String? message;

  const TooManyRequestsException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}
