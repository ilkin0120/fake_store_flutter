import 'package:fake_store/bloc/cart/cart_cubit.dart';
import 'package:fake_store/common/constants/ui_constants.dart';
import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/common/widgets/default_button.dart';
import 'package:fake_store/common/widgets/default_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/wishlist/wishlist_cubit.dart';
import '../../domain/entities/product/product_entity.dart';

class ProductPage extends StatelessWidget {
  final ProductEntity product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWished = context.select<WishlistCubit, bool>(
      (cubit) => cubit.isWished(product.id),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.textFieldBackgroundColor,
        surfaceTintColor: context.color.textFieldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: context.color.tertiary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isWished ? Icons.favorite : Icons.favorite_border,
              color: isWished ? context.color.like : context.color.tertiary,
            ),
            onPressed: () => context.read<WishlistCubit>().toggle(product.id),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 1.7,
              color: context.color.textFieldBackgroundColor,
              child: DefaultImageContainer(
                imageUrl: product.image,
                width: width / 1.4,
                height: width / 1.4,
              ),
            ),

            const VerticalGap(24),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: UIConstants.defaultHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, style: context.text.titleMedium),
                  const VerticalGap(8),
                  Text(
                    product.category,
                    style: context.text.bodySmall.copyWith(
                      color: context.color.secondary,
                    ),
                  ),
                  const VerticalGap(8),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 12,
                        color: context.color.primaryText,
                      ),
                      const HorizontalGap(4),
                      Text(
                        product.rating.rate.toStringAsFixed(2),
                        style: context.text.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const HorizontalGap(4),
                      Text(
                        '${product.rating.count} Reviews',
                        style: context.text.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.color.secondary,
                        ),
                      ),
                    ],
                  ),
                  const VerticalGap(24),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: UIConstants.defaultHorizontalPadding,
              ),
              height: 96,
              color: context.color.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price',
                        style: context.text.bodyXSmall.copyWith(
                          color: context.color.secondary,
                        ),
                      ),

                      Text(
                        '\$${product.price}',
                        style: context.text.titleSmall.copyWith(
                          color: context.color.tertiary,
                        ),
                      ),
                    ],
                  ),
                  const HorizontalGap(24),

                  Expanded(
                    child: DefaultButton(
                      text: 'Add to cart',

                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      onPress: () =>context.read<CartCubit>().add(product.id),
                      mode: ButtonMode.dark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
