import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/home_cubit.dart';

import '../../../../../core/util/extensions.dart';
import '../../../../../core/util/units/units.dart';
import '../../../../shared/shared_widgets.dart';
import '../../../domain/entities/hourly_data_entity.dart';

class HourlyBottomSheet extends StatelessWidget {
  final HourlyDataEntity model;

  const HourlyBottomSheet({
    super.key,
    required this.model,
  });

  static Future<void> show(
    BuildContext context, {
    required HourlyDataEntity model,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: getBorderRadius(
          radius: 24,
          isTopLeftRounded: true,
          isTopRightRounded: true,
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return HourlyBottomSheet(model: model);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DefaultBottomSheet(
          title: '${model.day} ${model.time}',
          heightRatio: 0.6,
          children: [
            AppText(
              '${model.temperature} ${UnitsHelper.getTemperatureSign(state.selectedUnitType)}',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineLarge?.copyWith(
                fontSize: 40,
                height: 1.2,
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            AppText(
              model.weatherStatus.capitalize(),
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            AppText(
              'Humidity: ${model.humidity}%',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            AppText(
              'Pressure: ${model.pressure}',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            AppText(
              'Clouds: ${model.clouds}',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            AppText(
              'Visibility: ${model.visibility}',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 5.h),
            AppText(
              'Wind speed: ${model.windSpeed}',
              style: context.textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}
