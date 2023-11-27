import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherResponse({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
