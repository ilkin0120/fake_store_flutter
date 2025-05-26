import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';

import '../../common/constants/ui_constants.dart';
import '../../common/widgets/custom_gap.dart';
import '../../common/widgets/default_button.dart';

class CartBottomBar extends StatelessWidget {
  final double total;

  const CartBottomBar({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: UIConstants.defaultHorizontalPadding,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.color.textFieldBackgroundColor),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cart total',
                style: context.text.bodyXSmall.copyWith(
                  color: context.color.secondary,
                ),
              ),

              Text(
                '\$${total.toStringAsFixed(2)}',
                style: context.text.titleSmall.copyWith(
                  color: context.color.tertiary,
                ),
              ),
            ],
          ),
          const HorizontalGap(24),
          Expanded(
            child: DefaultButton(
              text: 'Checkout',
              onPress: () {},
              mode: ButtonMode.dark,
              height: 48,
            ),
          ),
        ],
      ),
    );
  }
}
