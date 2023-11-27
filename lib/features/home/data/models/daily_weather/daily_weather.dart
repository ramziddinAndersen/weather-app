import 'package:json_annotation/json_annotation.dart';

import '../feels_like/feels_like.dart';
import '../temperature/temperature.dart';
import '../weather/weather.dart';

part 'daily_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyWeatherResponse {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  @JsonKey(name: 'moon_phase')
  double? moonPhase;
  TemperatureResponse? temp;
  @JsonKey(name: 'feels_like')
  FeelsLikeResponse? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: 'dew_point')
  double? dewPoint;
  @JsonKey(name: 'wind_speed')
  double? windSpeed;
  @JsonKey(name: 'wind_deg')
  int? windDeg;
  @JsonKey(name: 'wind_gust')
  double? windGust;
  List<WeatherResponse>? weather;
  int? clouds;
  double? pop;
  double? rain;
  double? uvi;

  DailyWeatherResponse({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  factory DailyWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherResponseToJson(this);
}
