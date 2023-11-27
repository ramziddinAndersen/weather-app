import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';

class WeatherIcon extends StatelessWidget {
  final String iconUrl;
  final double? size;
  final Color? backgroundColor;

  const WeatherIcon({
    super.key,
    required this.iconUrl,
    this.size = 80,
    this.backgroundColor = AppColors.primaryLightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      padding: EdgeInsets.all(10.w),
      child: Image.asset(iconUrl, width: size),
    );
  }
}
