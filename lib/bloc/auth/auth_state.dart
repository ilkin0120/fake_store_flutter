part of 'auth_cubit.dart';

class AuthState {
  final String username;
  final String password;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const AuthState({
    this.username = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  AuthState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? false,
    );
  }
}