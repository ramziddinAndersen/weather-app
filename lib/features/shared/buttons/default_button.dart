import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/export.dart';
import '../../../core/util/extensions.dart';
import '../texts/app_text.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final bool isFilled;
  final Color? backgroundColor;
  final double? height;
  final bool enabled;
  final VoidCallback onPressed;

  const DefaultButton({
    super.key,
    this.child,
    this.isFilled = true,
    required this.onPressed,
    this.backgroundColor,
    this.text,
    this.height,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : .5,
      child: MaterialButton(
        onPressed: () {
          if (enabled) {
            onPressed();
          }
        },
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(0),
        color: backgroundColor ??
            (isFilled ? AppColors.primaryDarkColor : AppColors.textFieldBackground),
        child: Container(
          height: height ?? 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: backgroundColor == null && isFilled
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: child ??
              Center(
                child: AppText(
                  text ?? '',
                  style: context.textTheme.titleLarge?.copyWith(
                    color: isFilled ? Colors.white : Colors.black,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
