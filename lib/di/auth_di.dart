import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../bloc/auth/auth_cubit.dart';
import '../data/datasources/auth_remote_datasource.dart';
import '../domain/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/auth/login_usecase.dart';
import 'core_di.dart';

Future<void> setupAuthDependencies() async {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(loginUseCase: getIt<LoginUseCase>()),
  );
}
