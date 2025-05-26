import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,

    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
  });

  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      textInputAction: textInputAction,
      style: context.text.bodyMedium,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: context.text.bodyMedium.copyWith(
          fontWeight: FontWeight.w500,
          color: context.color.textFieldHintColor,
        ),
        filled: true,
        fillColor: context.color.textFieldBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18,
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.color.defaultBorderColor),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
