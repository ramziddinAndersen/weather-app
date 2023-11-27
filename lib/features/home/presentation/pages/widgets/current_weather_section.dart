import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';
import '../../../../../core/util/extensions.dart';
import '../../../../../core/util/icon_selector/icon_selector.dart';
import '../../../../../core/util/units/units.dart';
import '../../../../shared/shared_widgets.dart';
import '../../cubit/home_cubit.dart';
import 'export.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: 100.h,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: getBorderRadius(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherIcon(
                size: 64.w,
                backgroundColor: AppColors.primaryLightColor,
                iconUrl: getWeatherAppIcon(iconName: state.currentWeatherEntity.iconName),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      state.currentWeatherEntity.temperature,
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: AppText(
                        UnitsHelper.getTemperatureSign(state.selectedUnitType),
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(
                    'Humidity: ${state.currentWeatherEntity.humidity}%',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  AppText(
                    'Pressure: ${state.currentWeatherEntity.pressure}',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  AppText(
                    'WindSpeed: ${state.currentWeatherEntity.windSpeed}',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  AppText(
                    'Clouds: ${state.currentWeatherEntity.clouds}',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
