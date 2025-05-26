import 'package:dio/dio.dart';
import 'package:fake_store/bloc/wishlist/wishlist_cubit.dart';
import 'package:fake_store/data/datasources/wishlist_local_datasource.dart';
import 'package:fake_store/data/repositories/wishlist_repository_impl.dart';
import 'package:fake_store/domain/repositories/wishlist_repository.dart';
import 'package:fake_store/domain/usecases/wishlist/get_wishlist_usecase.dart';
import 'package:fake_store/domain/usecases/wishlist/toggle_wishlist_usecase.dart';

import 'core_di.dart';

Future<void> setupWishlistDependencies() async {
  getIt.registerLazySingleton<WishlistLocalDataSource>(
    () => WishlistLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<WishlistRepository>(
    () => WishlistRepositoryImpl(getIt<WishlistLocalDataSource>()),
  );

  getIt.registerLazySingleton<GetWishlistUseCase>(
    () => GetWishlistUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton<ToggleWishlistItemUseCase>(
    () => ToggleWishlistItemUseCase(getIt<WishlistRepository>()),
  );
  getIt.registerLazySingleton<WishlistCubit>(
    () => WishlistCubit(
      getWishlistUseCase: getIt<GetWishlistUseCase>(),
      toggleWishlistItemUseCase: getIt<ToggleWishlistItemUseCase>(),
    ),
  );
}
