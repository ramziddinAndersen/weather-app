import 'package:json_annotation/json_annotation.dart';

import '../weather/weather.dart';

part 'hourly_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class HourlyWeatherResponse {
  int? dt;
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
  @JsonKey(name: 'wind_gust')
  double? windGust;
  List<WeatherResponse>? weather;
  double? pop;

  HourlyWeatherResponse({
    this.dt,
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
    this.windGust,
    this.weather,
    this.pop,
  });

  factory HourlyWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherResponseToJson(this);
}
