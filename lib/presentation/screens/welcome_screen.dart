import 'package:fake_store/common/extensions/context_ext.dart';

import 'package:fake_store/common/widgets/custom_gap.dart';
import 'package:fake_store/common/widgets/custom_svg.dart';
import 'package:fake_store/common/widgets/default_button.dart';
import 'package:fake_store/routes/route_names.dart';

import 'package:flutter/material.dart';

import '../../common/constants/assets.dart';
import '../../common/constants/ui_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.welcome, // замени на своё
              fit: BoxFit.cover, // «кавер» = обрезать, сохраняя пропорции
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultHorizontalPadding,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(flex: 2),
                    CustomSvg(
                      asset: Assets.icons.branding,
                      width: 58,
                      height: 58,
                    ),
                    const VerticalGap(17),
                    Text('Fake Store', style: context.text.titleLarge),
                    const VerticalGap(40),
                    DefaultButton(
                      onPress: () => Navigator.pushNamed(context, loginRoute),
                      text: 'Login',
                      mode: ButtonMode.dark,
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
