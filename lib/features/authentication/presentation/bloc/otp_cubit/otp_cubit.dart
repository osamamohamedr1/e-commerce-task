import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/verify_mail_repo.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final VerifyMailRepo verifyMailRepo;

  OtpCubit(this.verifyMailRepo) : super(OtpInitial());

  Future<void> verifyMail({required String email, required String otp}) async {
    emit(VerifyMailLoading());

    final result = await verifyMailRepo.verifyOtp(email, otp);

    result.fold(
      (failure) => emit(VerifyMailFailure(failure.errorMessage)),
      (success) => emit(VerifyMailSuccess('Email verified successfully!')),
    );
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoading());

    final result = await verifyMailRepo.resendOtp(email);

    result.fold(
      (failure) => emit(ResendOtpFailure(failure.errorMessage)),
      (success) =>
          emit(ResendOtpSuccess('Verification code sent successfully!')),
    );
  }
}
