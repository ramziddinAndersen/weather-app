import 'package:json_annotation/json_annotation.dart';

import '../weather/weather.dart';

part 'current_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherResponse {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: 'dew_point')
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  List<WeatherResponse>? weather;

  CurrentWeatherResponse({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
  });

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseToJson(this);
}
