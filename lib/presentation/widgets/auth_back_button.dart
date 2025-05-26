import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).maybePop(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.color.defaultBorderColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: context.color.primaryText,
          ),
        ),
      ),
    );
  }
}
