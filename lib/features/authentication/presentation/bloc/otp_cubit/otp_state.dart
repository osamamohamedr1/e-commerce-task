part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

// Verify OTP States
final class VerifyMailLoading extends OtpState {}

final class VerifyMailSuccess extends OtpState {
  final String message;
  VerifyMailSuccess(this.message);
}

final class VerifyMailFailure extends OtpState {
  final String error;
  VerifyMailFailure(this.error);
}

// Resend OTP States
final class ResendOtpLoading extends OtpState {}

final class ResendOtpSuccess extends OtpState {
  final String message;
  ResendOtpSuccess(this.message);
}

final class ResendOtpFailure extends OtpState {
  final String error;
  ResendOtpFailure(this.error);
}
