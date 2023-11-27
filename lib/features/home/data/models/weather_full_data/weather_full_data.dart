import 'package:json_annotation/json_annotation.dart';

import '../current_weather/current_weather.dart';
import '../daily_weather/daily_weather.dart';
import '../hourly_weather/hourly_weather.dart';

part 'weather_full_data.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherFullDataResponse {
  double? lat;
  double? lon;
  String? timezone;
  @JsonKey(name: 'timezone_offset')
  int? timezoneOffset;
  CurrentWeatherResponse? current;
  List<HourlyWeatherResponse>? hourly;
  List<DailyWeatherResponse>? daily;

  WeatherFullDataResponse({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  factory WeatherFullDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherFullDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherFullDataResponseToJson(this);
}
