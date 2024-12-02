import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showCart;
  final bool showBackButton;
  final VoidCallback backBtnCallBack;

  const MyAppBar({
    super.key,
    required this.title,
    required this.showCart,
    required this.showBackButton,
    required this.backBtnCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.headlineColor,
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
      leading: Visibility(
        visible: showBackButton,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            backBtnCallBack();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: AppColors.headlineColor,
          ),
        ),
      ),
      actions: [
        Visibility(
          visible: showCart,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    // Navigator.pushNamed(context, mainViewRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      'assets/images/cart_icon.png',
                    ),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Visibility(
              //     visible: Constants.cartItems.isNotEmpty,
              //     child: Container(
              //       margin: const EdgeInsets.only(left: 40, right: 0, top: 2),
              //       width: 20,
              //       height: 20,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: AppColors.white,
              //         border: Border.all(
              //           width: 1,
              //           color: AppColors.primaryColor,
              //         ),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             Constants.cartItems.length.toString(),
              //             style: const TextStyle(
              //                 color: AppColors.primaryColor,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 12),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
