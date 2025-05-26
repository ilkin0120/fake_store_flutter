import 'package:fake_store/common/constants/ui_constants.dart';
import 'package:fake_store/presentation/screens/cart.dart';
import 'package:fake_store/presentation/screens/home.dart';
import 'package:fake_store/presentation/screens/wishlist.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_bottom_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _pages = const [Home(), Cart(), Wishlist()];

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: IndexedStack(index: currentIndex, children: _pages),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) => _currentIndexNotifier.value = index,
          ),
        );
      },
    );
  }
}
