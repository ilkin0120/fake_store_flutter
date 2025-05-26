import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// Text label to display inside the button.
  final Text? label;

  /// Whether the button should display a loading state.
  final bool isLoading;

  /// Whether the button is enabled and clickable.
  final bool isEnabled;

  /// Callback to execute when the button is clicked.
  final VoidCallback onPressed;

  /// Custom decoration style for the button container.
  final BoxDecoration? style;

  /// Padding for the button content.
  final EdgeInsets? padding;

  /// Fixed height for the button.
  final double? height;

  /// Fixed width for the button.
  final double? width;

  /// Constructor for [CustomButton].
  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.padding,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isEnabled && !isLoading ? onPressed : null,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: padding,
        decoration: style,
        child: label,
      ),
    );
  }
}
