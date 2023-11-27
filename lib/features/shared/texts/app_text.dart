import 'package:flutter/material.dart';

import '../../../core/util/extensions.dart';

class AppText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.maxLines,
    this.style,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: style ?? context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSecondary),
    );
  }
}
