import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setupCoreDependencies() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
}