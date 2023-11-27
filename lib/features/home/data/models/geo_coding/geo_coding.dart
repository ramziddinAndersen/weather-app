import 'package:json_annotation/json_annotation.dart';

part 'geo_coding.g.dart';

@JsonSerializable(explicitToJson: true)
class GeoCodingResponse {
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: 0)
  double lat;
  @JsonKey(defaultValue: 0)
  double lon;
  @JsonKey(defaultValue: '')
  String country;
  @JsonKey(defaultValue: '')
  String state;

  GeoCodingResponse({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory GeoCodingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeoCodingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCodingResponseToJson(this);
}
