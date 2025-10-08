import 'package:bloc/bloc.dart';
import 'package:e_commerce_task/features/authentication/data/models/login_response_model.dart';
import 'package:e_commerce_task/features/authentication/data/models/register_body_model.dart';
import 'package:e_commerce_task/features/authentication/data/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(LoginInitial());
  final AuthRepository _authRepository;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    var result = await _authRepository.login(email: email, password: password);
    result.fold(
      (fail) {
        emit(LoginFailure(fail.errorMessage));
      },
      (success) {
        emit(LoginSuccess(success));
      },
    );
  }

  Future<void> register({required RegisterBodyModel body}) async {
    emit(RegisterLoading());
    var result = await _authRepository.register(body: body);
    result.fold(
      (fail) {
        emit(RegisterFailure(fail.errorMessage));
      },
      (success) {
        emit(RegisterSuccess(success));
      },
    );
  }
}
