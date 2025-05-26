import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/common/widgets/default_button.dart';
import 'package:fake_store/common/widgets/default_image_container.dart';
import 'package:fake_store/routes/route_names.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_icon_button.dart';
import '../../domain/entities/product/product_entity.dart';

class WishlistItem extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onToggleFavorite;
  final bool isWished;

  const WishlistItem({
    super.key,
    required this.product,
    required this.onToggleFavorite,
    required this.isWished,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, productPageRoute,arguments: {'product':product}),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(right: 16, left: 21),
        child: Row(
          children: [
            DefaultImageContainer(imageUrl: product.image),
            const HorizontalGap(21),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
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
                    const VerticalGap(8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: context.text.bodyXSmall.copyWith(
                        color: context.color.primaryText.withValues(alpha: 0.75),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const VerticalGap(8),
                    DefaultButton(
                      text: 'Add to cart',
                      onPress: () {},
                      mode: ButtonMode.light,
                      textStyle: context.text.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
