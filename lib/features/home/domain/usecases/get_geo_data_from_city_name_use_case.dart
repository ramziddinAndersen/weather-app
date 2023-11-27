import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/geo_coding_entity.dart';
import '../repositories/geo_data_repository.dart';

class GetGeoDataFromCityNameUseCase {
  GetGeoDataFromCityNameUseCase(this.repository);

  final GeoDataRepository repository;

  Future<Either<Failure, GeoCodingEntity>> getGeoDataFromCityName(
    GetGeoDataFromCityNameParams params,
  ) async {
    return repository.getGeoDataFromCityName(cityName: params.cityName);
  }
}

class GetGeoDataFromCityNameParams extends Equatable {
  final String cityName;

  const GetGeoDataFromCityNameParams({
    required this.cityName,
  });

  @override
  List<Object?> get props => [cityName];
}
