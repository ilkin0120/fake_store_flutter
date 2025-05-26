import 'package:fake_store/bloc/wishlist/wishlist_cubit.dart';
import 'package:fake_store/common/constants/ui_constants.dart';
import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/presentation/widgets/custom_app_bar.dart';
import 'package:fake_store/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product/product_cubit.dart';

import '../../domain/entities/product/product_entity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<ProductCubit>();
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !cubit.state.isLoading &&
          !cubit.state.hasReachedMax) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Welcome,\nUsername'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UIConstants.defaultHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalGap(32),
            Text('Fake Store', style: context.text.titleMedium),
            const VerticalGap(22),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state.products.isEmpty && state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 8),
                    separatorBuilder: (context, index) => VerticalGap(8),
                    controller: _scrollController,
                    itemCount:
                        state.products.length + (state.hasReachedMax ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index >= state.products.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final ProductEntity product = state.products[index];
                      return BlocBuilder<WishlistCubit, WishlistState>(
                        buildWhen: (prev, curr) {
                          final wasWished = prev.ids.contains(product.id);
                          final isWished = curr.ids.contains(product.id);
                          return wasWished != isWished;
                        },
                        builder: (context, state) {
                          return ProductItem(
                            product: product,
                            isWished: context.read<WishlistCubit>().isWished(
                              product.id,
                            ),
                            onToggleFavorite:
                                () => context.read<WishlistCubit>().toggle(
                                  product.id,
                                ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
