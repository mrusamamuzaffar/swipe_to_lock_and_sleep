import 'package:flutter/material.dart';

class MyAppBehavior{
  GlobalKey sleepSideDotTwoKey, sliderKey;
  Offset sleepSideDotTwoOffset, sliderOffset;
  RenderBox sleepSideDotTwoRenderBox, sliderRenderBox;
  IconData sliderIcon = Icons.lock;
  Size sliderSize;

  double lockWidth, lockHeight, lockSideDotOneWidth,
      lockSideDotOneHeight, lockSideDotTwoWidth,
      lockSideDotTwoHeight, sleepWidth, sleepHeight,
      sleepSideDotOneWidth, sleepSideDotOneHeight,
      sleepSideDotTwoWidth, sleepSideDotTwoHeight,
      sliderWidth, sliderHeight, sliderRange, x = 0.0,
      sliderIconSize;

  Color sliderColor = Colors.white,
      lockSideLeftDotColor = Colors.black26,
      lockSideRightDotColor = Colors.red,
      sleepSideLeftDotColor = Colors.red,
      sleepSideRightDotColor = Colors.black26;
}