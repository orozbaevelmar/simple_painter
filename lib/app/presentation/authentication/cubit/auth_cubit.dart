import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/data/authentication/models/register_model.dart';
import 'package:simple_painter/app/data/authentication/repository/auth_repository.dart';
import 'package:simple_painter/core/di/di_locator.dart';
import 'package:simple_painter/core/enums/fetch_status.dart';
import 'package:simple_painter/shared/constants/app_fail_strings.dart';
import 'package:simple_painter/shared/error/failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  AuthCubit() : super(AuthState());

  Future<void> register({required RegisterModel registerModel}) async {
    emit(state.copyWith(status: FetchStatus.loading));

    final response = await _authRepository.register(registerModel);
    response.fold(
      (l) {
        emit(
          state.copyWith(
            status: FetchStatus.error,
            error: _failureToMessage(l),
          ),
        );
      },
      (r) async {
        emit(state.copyWith(status: FetchStatus.success));
      },
    );
  }

  Future<void> login({required LoginModel loginModel}) async {
    emit(state.copyWith(status: FetchStatus.loading));

    final response = await _authRepository.login(loginModel);
    response.fold(
      (l) {
        emit(
          state.copyWith(
            status: FetchStatus.error,
            error: _failureToMessage(l),
          ),
        );
      },
      (r) async {
        emit(state.copyWith(status: FetchStatus.success));
      },
    );
  }

  Future<void> logOut() async {
    emit(state.copyWith(status: FetchStatus.loading));

    final response = await _authRepository.logOut();
    response.fold(
      (l) {
        emit(
          state.copyWith(
            status: FetchStatus.error,
            error: _failureToMessage(l),
          ),
        );
      },
      (r) async {
        emit(state.copyWith(status: FetchStatus.success));
      },
    );
  }

  Future<void> isLoggedIn() async {
    emit(state.copyWith(status: FetchStatus.loading));
    final theFirstPage = _authRepository.isLoggedIn();
    if (theFirstPage.isLoggedIn) {
      emit(state.copyWith(status: FetchStatus.success));
    } else if (theFirstPage.isVerifyingEmail) {
      emit(state.copyWith(status: FetchStatus.error));
    } else {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }

  String _failureToMessage(Failure failure) => switch (failure) {
    ServerFailure() =>
      failure.message?.contains(
                '[firebase_auth/invalid-credential] The supplied auth credential is malformed or has expired',
              ) ??
              false
          ? 'Неправильный email или пароль'
          : AppFailStrings.SERVER_FAILURE_MESSAGE,
    OfflineFailure() => AppFailStrings.OFFLINE_FAILURE_MESSAGE,
    WeekPassFailure() => AppFailStrings.WEEK_PASS_FAILURE_MESSAGE,
    ExistedAccountFailure() => AppFailStrings.EXISTED_ACCOUNT_FAILURE_MESSAGE,
    NoUserFailure() => AppFailStrings.NO_USER_FAILURE_MESSAGE,
    TooManyRequestsFailure() =>
      AppFailStrings.TOO_MANY_REQUESTS_FAILURE_MESSAGE,
    WrongPasswordFailure() => AppFailStrings.WRONG_PASSWORD_FAILURE_MESSAGE,
    UnmatchedPassFailure() => AppFailStrings.UNMATCHED_PASSWORD_FAILURE_MESSAGE,
    NotLoggedInFailure() => 'Вы не авторизованы.',
    _ => 'Неожиданная ошибка, пожалуйста, попробуйте позже',
  };
}
