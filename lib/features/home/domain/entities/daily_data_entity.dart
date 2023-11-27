import 'package:equatable/equatable.dart';

class DailyDataEntity extends Equatable {
  final String iconName;
  final String day;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String weatherStatus;
  final String dayTemperature;
  final String nightTemperature;
  final String eveningTemperature;
  final String morningTemperature;
  final String humidity;
  final String pressure;
  final String clouds;
  final String windSpeed;

  const DailyDataEntity({
    required this.iconName,
    required this.day,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.weatherStatus,
    required this.dayTemperature,
    required this.nightTemperature,
    required this.eveningTemperature,
    required this.morningTemperature,
    required this.humidity,
    required this.pressure,
    required this.clouds,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        iconName,
        day,
        sunrise,
        sunset,
        moonrise,
        moonset,
        weatherStatus,
        dayTemperature,
        nightTemperature,
        eveningTemperature,
        morningTemperature,
        humidity,
        pressure,
        clouds,
        windSpeed,
      ];
}
