import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/icon_selector/icon_selector.dart';
import '../../../../shared/shared_widgets.dart';
import '../../cubit/home_cubit.dart';
import 'export.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const DefaultLoader();
        }

        if (state.selectedWeatherType.type == 0) {
          if (state.hourlyDataList.isEmpty) {
            return const SizedBox.shrink();
          }

          return ListView.builder(
            itemCount: state.hourlyDataList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final model = state.hourlyDataList[index];
              final iconUrl = getWeatherAppIcon(iconName: model.iconName);

              return WeatherListHourlyItem(iconUrl: iconUrl, model: model);
            },
          );
        } else {
          if (state.dailyDataList.isEmpty) {
            return const SizedBox.shrink();
          }

          return ListView.builder(
            itemCount: state.dailyDataList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final model = state.dailyDataList[index];
              final iconUrl = getWeatherAppIcon(iconName: model.iconName);

              return WeatherListDailyItem(iconUrl: iconUrl, model: model);
            },
          );
        }
      },
    );
  }
}
