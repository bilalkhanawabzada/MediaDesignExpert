import 'package:flutter/material.dart';
import 'package:jaat_app/widgets/loading_mixin.dart';

import '../core/res/utils/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget with LoadingMixin {
  final Function() onPressed;
  final String title;
  final bool isLoading;
  final Color? disabledColor;
  final Color? color;
  final Color? textColor;
  const ElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.color,
    this.textColor,
    this.disabledColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? buildLoading()
          : Text(
              title,
              style:  TextStyle(
                color: textColor?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
