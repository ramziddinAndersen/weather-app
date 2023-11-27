import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/export.dart';
import '../../../core/util/extensions.dart';
import '../shared_widgets.dart';
import 'widgets/bottom_sheet_top_icon.dart';

class DefaultBottomSheet extends StatelessWidget {
  final String title;
  final bool addBottomPadding;
  final List<Widget> children;
  final double heightRatio;

  const DefaultBottomSheet({
    super.key,
    required this.title,
    required this.children,
    this.addBottomPadding = true,
    this.heightRatio = 0.45,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double bottom1 = MediaQuery.of(context).padding.bottom;
    final double bottom2 = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(maxHeight: screenHeight * heightRatio),
      padding: EdgeInsets.only(
        top: 8,
        bottom: addBottomPadding ? bottom1 + 16 + bottom2 : 0,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: getBorderRadius(
          radius: 24,
          isTopLeftRounded: true,
          isTopRightRounded: true,
        ),
      ),
      child: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            const BottomSheetTopIcon(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.borderColor, width: .5),
                ),
              ),
              child: AppText(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
            SizedBox(height: bottom1 + 16 + bottom2)
          ],
        ),
      ),
    );
  }
}
