import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/weather_data_entity.dart';
import '../repositories/weather_repository.dart';

class GetWeatherDataUseCase {
  GetWeatherDataUseCase(this.repository);

  final WeatherRepository repository;

  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromServer(
    GetWeatherDataParams params,
  ) async {
    return repository.getWeatherDataFromServer(
      lat: params.lat,
      lon: params.lon,
      units: params.units,
    );
  }

  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromLocalFile(
    GetWeatherDataParams params,
  ) async {
    return repository.getWeatherDataFromLocalFile(lat: params.lat, lon: params.lon);
  }
}

class GetWeatherDataParams extends Equatable {
  final double lat;
  final double lon;
  final String units;

  const GetWeatherDataParams({
    required this.lat,
    required this.lon,
    required this.units,
  });

  @override
  List<Object?> get props => [lat, lon, units];
}
