import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

class IconsRowInStack extends StatelessWidget {
  final IconData? closeIcon;
  final IconData? rightIcon;
  final VoidCallback? closeIconPressed;
  final VoidCallback? onRightIconPressed;

  const IconsRowInStack({
    super.key,
    this.closeIcon,
    this.rightIcon,
    this.closeIconPressed,
    this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left Icon (if provided)
              if (closeIcon != null)
                IconButton(
                  onPressed: closeIconPressed  ,
                  icon: Icon(closeIcon),
                  iconSize: 24,
                  color: Colors.black,
                  padding: const EdgeInsets.all(0),
                )
              else
                const SizedBox.shrink(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ), // Placeholder to maintain alignment
          
              // Right Icon (if provided)
              if (rightIcon != null)
                IconButton(
                  onPressed: onRightIconPressed,
                  icon: Icon(rightIcon),
                  iconSize: 24,
                  color: Colors.black,
                )
              else
                const SizedBox.shrink(), // Placeholder to maintain alignment
            ],
          ),
        ),
      ],
    );
  }
}
