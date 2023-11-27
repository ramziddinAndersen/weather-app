import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ErrorModel {

  ErrorModel({
    this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
  String? message;

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
