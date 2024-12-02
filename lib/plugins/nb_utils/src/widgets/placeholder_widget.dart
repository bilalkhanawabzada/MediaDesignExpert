import 'dart:math';

import 'package:flutter/material.dart';

import '/plugins/nb_utils/nb_utils.dart';

/// Colors for PlaceHolderWidget
List<Color> _placeholderColors = [
  mistyRose,
  whiteSmoke,
  linen,
  const Color(0xFFb7efc5),
  const Color(0xFFf0efeb),
  const Color(0xFFcddafd),
  const Color(0xFFe3d5ca),
  const Color(0xFFffccd5),
  const Color(0xFFccdbdc),
  const Color(0xFFfbf8cc),
  const Color(0xFFcdeac0),
  const Color(0xFFefe5dc),
];

/// Set nicely colored PlaceHolder while image is loading
class PlaceHolderWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Duration? animationDuration;

  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const PlaceHolderWidget({
    this.height,
    this.width,
    this.animationDuration,
    this.padding,
    this.margin,
    this.alignment,
    this.shape,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      duration: animationDuration ?? 1.seconds,
      width: width,
      decoration: BoxDecoration(
        color: _placeholderColors[Random.secure().nextInt(_placeholderColors.length)],
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      alignment: alignment,
      padding: padding,
      margin: margin,
    );
  }
}
