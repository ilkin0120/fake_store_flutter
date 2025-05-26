import 'package:bloc/bloc.dart';

import '../../domain/usecases/auth/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const AuthState());
  final LoginUseCase _loginUseCase;

  void updateUsername(String username) {
    emit(state.copyWith(username: username, errorMessage: null));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password, errorMessage: null));
  }

  bool isValid() {
    return state.username.trim().length > 3 && state.password.trim().length > 3;
  }

  Future<void> login() async {
    if (!isValid()) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final success = await _loginUseCase(state.username.trim(), state.password);
      if (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Invalid username or password',
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Login failed'));
    }
  }
}
