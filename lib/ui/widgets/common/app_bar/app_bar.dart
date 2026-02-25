import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      title: Text(
        'Turkey',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          fontFamily: 'SF Pro Display',
        ),
      ),
      leading: Icon(Icons.chevron_left, color: Colors.white, size: 28.w),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/icon/cart.png',
            width: 24.w,
            height: 24.w,
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
