import 'package:flutter/material.dart';

class BottomOnlyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height + 20);
  }

  @override
  bool shouldReclip(BottomOnlyClipper oldClipper) => false;
}
