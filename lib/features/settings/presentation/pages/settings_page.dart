import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/extensions.dart';
import '../../../shared/shared_widgets.dart';
import '../widgets/units_dropdown.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppText(
                    'Measurement units',
                    maxLines: 3,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                SizedBox(width: 10.w),
                const Align(
                  alignment: Alignment.topRight,
                  child: UnitsDropdown(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
