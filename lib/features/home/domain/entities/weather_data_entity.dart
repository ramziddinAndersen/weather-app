import 'package:equatable/equatable.dart';

import 'current_weather_entity.dart';
import 'daily_data_entity.dart';
import 'hourly_data_entity.dart';

class WeatherDataEntity extends Equatable {
  final String locationText;
  final CurrentWeatherEntity currentWeatherEntity;
  final List<HourlyDataEntity> hourlyDataList;
  final List<DailyDataEntity> dailyDataList;

  const WeatherDataEntity({
    required this.locationText,
    required this.currentWeatherEntity,
    required this.hourlyDataList,
    required this.dailyDataList,
  });

  @override
  List<Object?> get props => [locationText, currentWeatherEntity, hourlyDataList, dailyDataList];
}
