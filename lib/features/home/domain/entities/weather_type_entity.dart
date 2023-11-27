import 'package:equatable/equatable.dart';

class WeatherTypeEntity extends Equatable {
  final int type; // 0 for Hourly, 1 for daily
  final String text;

  const WeatherTypeEntity({
    required this.type,
    required this.text,
  });

  @override
  List<Object?> get props => [type, text];
}
