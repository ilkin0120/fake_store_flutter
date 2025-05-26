import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://fakestoreapi.com/auth/login',
        data: {"username": username, "password": password},
      );

      final token = response.data['token'];
      if (token == null || token is! String) {
        throw Exception('No token received');
      }

      return token;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'] ?? 'Login failed';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
