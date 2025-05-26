import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final VoidCallback onPressed;
  final bool ripple;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 16,
    this.color = Colors.black,
    this.ripple = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: size, color: color);

    if (ripple) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: iconWidget,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: iconWidget,
    );
  }
}
