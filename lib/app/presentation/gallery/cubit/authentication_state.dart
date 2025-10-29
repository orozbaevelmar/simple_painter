// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'authentication_cubit.dart';

// class AuthenticationState extends Equatable {
//   const AuthenticationState({
//     this.status = FetchStatus.initial,
//     this.loginModel,
//     this.error,
//     this.registerModel,
//   });

//   final FetchStatus status;
//   final LoginModel? loginModel;
//   final String? error;
//   final RegisterModel? registerModel;

//   @override
//   List<Object?> get props => [status, loginModel, error, registerModel];

//   AuthenticationState copyWith({
//     FetchStatus? status,
//     LoginModel? loginModel,
//     String? error,
//     RegisterModel? registerModel,
//   }) {
//     return AuthenticationState(
//       status: status ?? this.status,
//       loginModel: loginModel ?? this.loginModel,
//       error: error ?? this.error,
//       registerModel: registerModel ?? this.registerModel,
//     );
//   }
// }
