import 'package:flutter/material.dart';

import '../../../core/util/extensions.dart';
import '../shared_widgets.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText(
        title,
        style: context.textTheme.titleLarge,
      ),
      centerTitle: false,
      backgroundColor: context.colorScheme.background,
      elevation: 4,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
