import '../../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<bool> call(String username, String password) async {
    try {
      final token = await _repository.login(username, password);
      return token.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
