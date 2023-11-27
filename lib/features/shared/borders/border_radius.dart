import 'package:flutter/material.dart';

BorderRadius getBorderRadius({
  double radius = 10,
  bool isAllRadius = true,
  bool isTopRightRounded = true,
  bool isTopLeftRounded = true,
  bool isBottomRightRounded = true,
  bool isBottomLeftRounded = true,
}) {
  final rad = Radius.circular(radius);
  return isAllRadius
      ? BorderRadius.all(rad)
      : BorderRadius.only(
          topLeft: isTopLeftRounded ? rad : Radius.zero,
          topRight: isTopRightRounded ? rad : Radius.zero,
          bottomLeft: isBottomLeftRounded ? rad : Radius.zero,
          bottomRight: isBottomRightRounded ? rad : Radius.zero,
        );
}
