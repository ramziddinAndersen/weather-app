import 'package:equatable/equatable.dart';

class GeoCodingEntity extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String state;

  const GeoCodingEntity({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  @override
  List<Object?> get props => [name, lat, lon, country, state];
}
