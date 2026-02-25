import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';

class BundlesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCartPressed;

  const BundlesAppBar({
    Key? key,
    required this.onCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1.5),
            radius: 1.5,
            colors: [
              Color(0xFF1EC896),
              kcPrimaryColor,
            ],
          ),
        ),
      ),
      title: const Text(
        'Turkey',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'SF Pro Display',
        ),
      ),
      leading: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icon/cart.png',
            width: 24,
            height: 24,
            color: Colors.white,
          ),
          onPressed: onCartPressed,
        ),
        horizontalSpaceSmall,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
