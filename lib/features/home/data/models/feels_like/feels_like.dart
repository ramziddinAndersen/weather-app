import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable(explicitToJson: true)
class FeelsLikeResponse {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLikeResponse({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLikeResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeResponseToJson(this);
}
