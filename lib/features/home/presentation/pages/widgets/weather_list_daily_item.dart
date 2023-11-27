import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';
import '../../../../../core/util/extensions.dart';
import '../../../../../core/util/units/units.dart';
import '../../../../shared/shared_widgets.dart';
import '../../../domain/entities/daily_data_entity.dart';
import '../../cubit/home_cubit.dart';
import 'export.dart';

class WeatherListDailyItem extends StatelessWidget {
  final String iconUrl;
  final DailyDataEntity model;

  const WeatherListDailyItem({
    super.key,
    required this.iconUrl,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            DailyBottomSheet.show(context, model: model);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6.w),
            padding: EdgeInsets.all(10.w),
            height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDarkColor,
              borderRadius: getBorderRadius(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      model.day,
                      style: context.textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_right_alt, size: 22.w),
                  ],
                ),
                SizedBox(height: 7.h),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WeatherIcon(iconUrl: iconUrl, size: 24),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              model.weatherStatus.capitalize(),
                              style: context.textTheme.bodySmall,
                            ),
                            SizedBox(height: 2.h),
                            AppText(
                              'Temperature: ${model.dayTemperature} ${UnitsHelper.getTemperatureSign(state.selectedUnitType)}',
                              style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                            ),
                            SizedBox(height: 2.h),
                            AppText(
                              'Humidity: ${model.humidity}%',
                              style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
