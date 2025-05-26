import 'package:fake_store/bloc/cart/cart_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupCartDependencies() async {
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
}
