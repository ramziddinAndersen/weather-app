import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/geo_coding_entity.dart';
import '../../domain/repositories/geo_data_repository.dart';
import '../datasources/geo_data_data_source.dart';

class GeoDataRepositoryImpl implements GeoDataRepository {
  final GeoDataDataSource _dataSource;
  final NetworkInfo _networkInfo;

  GeoDataRepositoryImpl(
    this._dataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, GeoCodingEntity>> getGeoDataFromCityName({
    required String cityName,
  }) async {
    final isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await _dataSource.getGeoDataFromCityName(cityName: cityName);

        if (response.isNotEmpty) {
          final first = response.first;

          final result = GeoCodingEntity(
            name: first.name,
            lat: first.lat,
            lon: first.lon,
            country: first.country,
            state: first.state,
          );

          return Right(result);
        } else {
          return const Left(ServerFailure(message: 'Incorrect city name'));
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return const Left(ServerFailure(message: 'Failed'));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
