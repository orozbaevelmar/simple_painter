import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message = ''});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'ServerFailure'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'CacheFailure'});
}

class OfflineFailure extends Failure {
  const OfflineFailure({super.message = 'OfflineFailure'});
}

class WeekPassFailure extends Failure {
  const WeekPassFailure({super.message = 'WeekPassFailure'});
}

class ExistedAccountFailure extends Failure {
  const ExistedAccountFailure({super.message = 'ExistedAccountFailure'});
}

class NoUserFailure extends Failure {
  const NoUserFailure({super.message = 'NoUserFailure'});
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure({super.message = 'WrongPasswordFailure'});
}

class UnmatchedPassFailure extends Failure {
  const UnmatchedPassFailure({super.message = 'UnmatchedPassFailure'});
}

class NotLoggedInFailure extends Failure {
  const NotLoggedInFailure({super.message = 'NotLoggedInFailure'});
}

class EmailVerifiedFailure extends Failure {
  const EmailVerifiedFailure({super.message = 'EmailVerifiedFailure'});
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure({super.message = 'TooManyRequestsFailure'});
}
