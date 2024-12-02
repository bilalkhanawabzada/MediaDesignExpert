import 'package:flutter/material.dart';

/// It overrides the scroll behavior
/// for example if you want to eliminate Overscroll indicator, 
/// just wrap the widget in ScrollConfigration and give [behavior] as [MyBehavior]

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}