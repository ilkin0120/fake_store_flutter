import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_icon_button.dart';
import 'package:fake_store/common/widgets/default_image_container.dart';
import 'package:fake_store/domain/entities/product/product_entity.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_gap.dart';
import '../../routes/route_names.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onToggleFavorite;
  final bool isWished;

  const ProductItem({
    super.key,
    required this.product,
    required this.isWished,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, productPageRoute,arguments: {'product':product}),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withValues(alpha: 0.05),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        child: Row(
          children: [
            DefaultImageContainer(imageUrl: product.image),
            const HorizontalGap(36),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodyLarge,
                        ),
                      ),
                      const HorizontalGap(8),
                      CustomIconButton(
                        size: isWished ? 16 : 20,
                        icon:
                            isWished
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                        onPressed: onToggleFavorite,
                        color:
                            isWished
                                ? context.color.like
                                : context.color.quaternary,
                        ripple: true,
                      ),
                    ],
                  ),
                  const VerticalGap(4),
                  Text(
                    product.category,
                    style: context.text.bodyXSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.color.secondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 10,
                        color: context.color.primaryText,
                      ),
                      const HorizontalGap(4),
                      Text(
                        product.rating.rate.toStringAsFixed(2),
                        style: context.text.bodyXSmall.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const VerticalGap(12),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: context.text.bodySmall.copyWith(
                      color: context.color.primaryText.withValues(alpha: 0.75),
                      fontWeight: FontWeight.w600,
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
