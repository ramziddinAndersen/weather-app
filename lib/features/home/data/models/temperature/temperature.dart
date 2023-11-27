import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable(explicitToJson: true)
class TemperatureResponse {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  TemperatureResponse({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory TemperatureResponse.fromJson(Map<String, dynamic> json) =>
      _$TemperatureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureResponseToJson(this);
}
