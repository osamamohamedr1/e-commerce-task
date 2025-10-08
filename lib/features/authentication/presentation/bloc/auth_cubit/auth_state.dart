part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class LoginInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResponseModel loginResponseModel;

  LoginSuccess(this.loginResponseModel);
}

final class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String successMessage;

  RegisterSuccess(this.successMessage);
}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
