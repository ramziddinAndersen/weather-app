import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/weather_data_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromServer({
    required double lat,
    required double lon,
    required String units,
  });

  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromLocalFile({
    required double lat,
    required double lon,
  });
}
