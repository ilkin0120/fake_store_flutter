import 'package:fake_store/di/product_di.dart';
import 'package:fake_store/di/wishlist_di.dart';

import 'auth_di.dart';
import 'cart_di.dart';
import 'core_di.dart';

Future<void> setupDependencies() async {
  await setupCoreDependencies();
  await setupAuthDependencies();
  await setupProductDependencies();
  await setupWishlistDependencies();
  await setupCartDependencies();
}
