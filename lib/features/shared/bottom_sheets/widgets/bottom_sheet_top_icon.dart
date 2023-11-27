import 'package:flutter/material.dart';

class BottomSheetTopIcon extends StatelessWidget {
  const BottomSheetTopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 5,
        width: 40.0,
        decoration: BoxDecoration(
          color: const Color(0xFFBEC1C4),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
