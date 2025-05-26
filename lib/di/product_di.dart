import 'package:dio/dio.dart';
import 'package:fake_store/bloc/product/product_cubit.dart';
import 'package:fake_store/data/datasources/product_remote_datasource.dart';
import 'package:fake_store/data/repositories/product_repository_impl.dart';
import 'package:fake_store/domain/repositories/product_repository.dart';
import 'package:fake_store/domain/usecases/product/fetch_products_usecase.dart';
import 'package:get_it/get_it.dart';

import '../bloc/auth/auth_cubit.dart';
import '../data/datasources/auth_remote_datasource.dart';
import '../domain/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/auth/login_usecase.dart';
import 'core_di.dart';

Future<void> setupProductDependencies() async {
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );

  getIt.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(getIt<ProductRepository>()),
  );

  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(fetchProductsUseCase: getIt<FetchProductsUseCase>()),
  );
}
