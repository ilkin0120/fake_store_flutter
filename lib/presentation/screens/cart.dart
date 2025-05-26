import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/common/widgets/default_image_container.dart';
import 'package:fake_store/presentation/widgets/cart_bottom_bar.dart';
import 'package:fake_store/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/product/product_cubit.dart';
import '../../domain/entities/product/product_entity.dart';
import '../widgets/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>().state;
    final productMap = {
      for (final product in context.read<ProductCubit>().state.products)
        product.id: product,
    };

    final cartEntries = cart.entries.toList();
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: CartBottomBar(
        total: context.read<CartCubit>().total(productMap),
      ),
      body: BlocBuilder<CartCubit, Map<int, int>>(
        builder: (context, cart) {
          final products = cart.entries.toList();

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    final entry = products[index];
                    final id = entry.key;
                    final quantity = entry.value;

                    return CartItem(
                      product: productMap[id]!,
                      quantity: quantity,
                      onAdd: () => context.read<CartCubit>().add(id),
                      onRemove: () => context.read<CartCubit>().decrease(id),
                      onDelete: () => context.read<CartCubit>().remove(id),
                    );
                  },
                  separatorBuilder: (_, index) => const VerticalGap(24),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
