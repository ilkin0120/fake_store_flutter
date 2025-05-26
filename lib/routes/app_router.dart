import 'package:fake_store/bloc/auth/auth_cubit.dart';
import 'package:fake_store/bloc/cart/cart_cubit.dart';
import 'package:fake_store/bloc/product/product_cubit.dart';
import 'package:fake_store/bloc/wishlist/wishlist_cubit.dart';
import 'package:fake_store/di/auth_di.dart';
import 'package:fake_store/di/core_di.dart';
import 'package:fake_store/domain/entities/product/product_entity.dart';
import 'package:fake_store/presentation/screens/home.dart';
import 'package:fake_store/presentation/screens/login_screen.dart';
import 'package:fake_store/presentation/screens/product_page.dart';
import 'package:fake_store/presentation/screens/root_page.dart';
import 'package:fake_store/presentation/screens/welcome_screen.dart';
import 'package:fake_store/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_page_route.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case welcomeRoute:
        return CustomPageRoute(builder: (_) => WelcomeScreen());

      case loginRoute:
        return CustomPageRoute(
          builder:
              (_) => BlocProvider<AuthCubit>(
                create: (_) => getIt<AuthCubit>(),
                child: LoginScreen(),
              ),
        );
      case productPageRoute:
        final arguments = routeSettings.arguments as Map;
        final product = arguments['product'] as ProductEntity;
        return CustomPageRoute(
          builder:
              (_) => MultiBlocListener(
                listeners: [
                  BlocProvider.value(value: getIt<CartCubit>()),
                  BlocProvider.value(value: getIt<WishlistCubit>()),
                ],
                child: ProductPage(product: product),
              ),
        );
      case homeRoute:
        return CustomPageRoute(
          builder:
              (_) => MultiBlocListener(
                listeners: [
                  BlocProvider<ProductCubit>(
                    create: (_) => getIt<ProductCubit>()..loadInitial(),
                  ),
                  BlocProvider.value(value: getIt<CartCubit>()),
                  BlocProvider.value(
                    value: getIt<WishlistCubit>()..loadWishlist(),
                  ),
                ],
                child: RootPage(),
              ),
        );
      default:
        return null;
    }
  }
}
