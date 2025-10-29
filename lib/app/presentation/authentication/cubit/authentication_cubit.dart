import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_painter/app/data/authentication/models/login_model.dart';
import 'package:simple_painter/app/data/authentication/models/register_model.dart';
import 'package:simple_painter/app/data/authentication/repository/auth_repository.dart';
import 'package:simple_painter/core/di/di_locator.dart';
import 'package:simple_painter/core/enums/fetch_status.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  AuthenticationCubit() : super(AuthenticationState());

  Future<void> register({required RegisterModel registerModel}) async {
    emit(state.copyWith(status: FetchStatus.loading));

    final response = await _authRepository.register(
      registerModel: registerModel,
    );
    response.fold(
      (l) {
        emit(state.copyWith(status: FetchStatus.error, error: l.message));
      },
      (r) async {
        emit(state.copyWith(status: FetchStatus.success, loginModel: r));
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: FetchStatus.loading));
    final response = await _authRepository.login(
      email: email,
      password: password,
    );
    response.fold(
      (l) {
        emit(state.copyWith(status: FetchStatus.error, error: l.message));
      },
      (r) async {
        emit(state.copyWith(status: FetchStatus.success, loginModel: r));
      },
    );
  }
}
