import 'package:equatable/equatable.dart';

class HourlyDataEntity extends Equatable {
  final String iconName;
  final String day;
  final String time;
  final String weatherStatus;
  final String temperature;
  final String humidity;
  final String pressure;
  final String clouds;
  final String visibility;
  final String windSpeed;

  const HourlyDataEntity({
    required this.iconName,
    required this.day,
    required this.time,
    required this.weatherStatus,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        iconName,
        day,
        time,
        weatherStatus,
        temperature,
        humidity,
        pressure,
        clouds,
        visibility,
        windSpeed,
      ];
}
