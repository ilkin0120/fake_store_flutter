import 'package:fake_store/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/product_cubit.dart';
import '../../bloc/wishlist/wishlist_cubit.dart';
import '../../common/widgets/custom_gap.dart';
import '../widgets/custom_app_bar.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, wishlistState) {
            final wishlistIds = wishlistState.ids;
            final products = context.watch<ProductCubit>().state.products;
            final wishlistProducts =
                products
                    .where((product) => wishlistIds.contains(product.id))
                    .toList();

            if (wishlistProducts.isEmpty) {
              return const Center(child: Text('No items in wishlist'));
            }

            return ListView.separated(
              padding: const EdgeInsets.only(top: 30, bottom: 24),
              itemCount: wishlistProducts.length,
              separatorBuilder: (_, __) => const VerticalGap(8),
              itemBuilder: (_, index) {
                final product = wishlistProducts[index];
                return WishlistItem(
                  product: product,
                  isWished: true,
                  onToggleFavorite: () {
                    context.read<WishlistCubit>().toggle(product.id);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
