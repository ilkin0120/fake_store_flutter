import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum ButtonMode { light, dark }

class DefaultButton extends StatelessWidget {
  final ButtonMode mode;
  final String text;
  final VoidCallback onPress;
  final double width;
  final double? height;

  final bool isEnabled;
  final bool isLoading;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.mode,
    this.isEnabled = true,
    this.isLoading = false,
    this.width = double.infinity,
    this.height,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.color;
    final textColor =
        mode == ButtonMode.dark ? theme.background : theme.primaryText;
    final backgroundColor =
        mode == ButtonMode.dark ? theme.primaryText : theme.background;

    final alpha = isEnabled && !isLoading ? 1.0 : 0.5;
    return CustomButton(
      isEnabled: isEnabled,
      isLoading: isLoading,
      width: width,
      height: height,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      onPressed: onPress,
      label: Text(
        text,
        style:
            textStyle ??
            context.text.bodyLarge.copyWith(
              color: textColor.withValues(alpha: alpha),
            ),
      ),
      style: BoxDecoration(
        color: backgroundColor.withValues(alpha: alpha),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
