import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;
  final VoidCallback? onIconPressed;

  const CustomAppBar({
    super.key,
     this.icon,
     this.onIconPressed,
  }); // CustomAppBar

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(icon),
          iconSize: 32,
          onPressed: onIconPressed,
          color: AppColors.black,
        ), // leading IconButton
        title: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
            width: MediaQuery.of(context).size.width * 0.2, // 20% of screen width
            child: Image.asset(
              "assets/logos/logo_mde.png",
              fit: BoxFit.contain,
            )),
        centerTitle: true, // Center title can be added if needed
      ), // AppBar
    ); // Padding
  } // build
} // CustomAppBar

