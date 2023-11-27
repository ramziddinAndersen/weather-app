import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/geo_coding_entity.dart';

abstract class GeoDataRepository {
  Future<Either<Failure, GeoCodingEntity>> getGeoDataFromCityName({required String cityName});
}
