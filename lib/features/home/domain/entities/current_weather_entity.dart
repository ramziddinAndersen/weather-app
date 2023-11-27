import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable {
  final String iconName;
  final String weatherStatus;
  final String temperature;
  final String humidity;
  final String pressure;
  final String clouds;
  final String windSpeed;

  const CurrentWeatherEntity({
    required this.iconName,
    required this.weatherStatus,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.clouds,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        iconName,
        weatherStatus,
        temperature,
        humidity,
        pressure,
        clouds,
        windSpeed,
      ];
}
