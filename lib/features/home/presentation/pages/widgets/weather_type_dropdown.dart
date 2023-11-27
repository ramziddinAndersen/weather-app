import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/export.dart';
import '../../../../../core/util/extensions.dart';
import '../../../../../core/util/validator/validators.dart';
import '../../../../shared/shared_widgets.dart';
import '../../../domain/entities/weather_type_entity.dart';
import '../../cubit/home_cubit.dart';

class WeatherTypeDropdown extends StatefulWidget {
  const WeatherTypeDropdown({super.key});

  @override
  State<WeatherTypeDropdown> createState() => _WeatherTypeDropdownState();
}

class _WeatherTypeDropdownState extends State<WeatherTypeDropdown> {
  final weatherTypesList = <WeatherTypeEntity>[
    const WeatherTypeEntity(type: 0, text: 'Hourly'),
    const WeatherTypeEntity(type: 1, text: 'Daily')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 10.w, right: 5.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: getBorderRadius(),
          ),
          child: DropdownButton<String>(
            value: state.selectedWeatherType.text,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryDarkColor,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: AppColors.primaryDarkColor),
            underline: Container(
              height: 2,
              color: AppColors.white,
            ),
            dropdownColor: AppColors.white,
            onChanged: (String? newValue) {
              if (Validators.isStringNotEmpty(newValue)) {
                if (newValue == weatherTypesList[0].text) {
                  context.read<HomeCubit>().changeWeatherType(weatherTypesList[0]);
                } else {
                  context.read<HomeCubit>().changeWeatherType(weatherTypesList[1]);
                }
              }
            },
            items: weatherTypesList.map<DropdownMenuItem<String>>(
              (weatherType) {
                return DropdownMenuItem<String>(
                  value: weatherType.text,
                  child: AppText(
                    weatherType.text,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: weatherType.type == state.selectedWeatherType.type
                          ? AppColors.black
                          : AppColors.grayColor,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
