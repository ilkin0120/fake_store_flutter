import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_gap.dart';
import '../../common/widgets/default_image_container.dart';
import '../../domain/entities/product/product_entity.dart';

class CartItem extends StatelessWidget {
  final ProductEntity product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: context.color.error,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  DefaultImageContainer(imageUrl: product.image),
                  const HorizontalGap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title + product.title,
                          style: context.text.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: onRemove,
                              icon: Icon(
                                Icons.remove_circle_outline_rounded,
                                color: context.color.primaryText,
                              ),
                            ),
                            Text('$quantity'),
                            IconButton(
                              onPressed: onAdd,
                              icon: Icon(
                                Icons.add_circle_outline_rounded,
                                color: context.color.primaryText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const HorizontalGap(12),
            Text(
              '\$${(product.price * quantity).toStringAsFixed(2)}',
              style: context.text.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
