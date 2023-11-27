import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/util/storage/storage.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/daily_data_entity.dart';
import '../../domain/entities/hourly_data_entity.dart';
import '../../domain/entities/weather_data_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_data_source.dart';
import '../models/weather_full_data/weather_full_data.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;
  final NetworkInfo _networkInfo;

  WeatherRepositoryImpl(
    this._dataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromServer({
    required double lat,
    required double lon,
    required String units,
  }) async {
    final isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      try {
        final response = await _dataSource.getWeatherData(lat: lat, lon: lon, units: units);

        final result = prepareData(response);
        saveWeatherData(response); // Store data for offline use

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return const Left(ServerFailure(message: 'Failed'));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherDataEntity>> getWeatherDataFromLocalFile({
    required double lat,
    required double lon,
  }) async {
    final data = await readWeatherData();

    final result = prepareData(data);

    return Right(result);
  }

  WeatherDataEntity prepareData(WeatherFullDataResponse? weatherData) {
    final hourlyDataList = <HourlyDataEntity>[];
    final dailyDataList = <DailyDataEntity>[];

    if (weatherData != null) {
      final currentWeatherEntity = CurrentWeatherEntity(
        iconName: weatherData.current?.weather?.first.icon ?? Assets.icons.weather.w01d.path,
        weatherStatus: weatherData.current?.weather?.first.description ?? '',
        temperature: (weatherData.current?.temp?.truncate().toString()) ?? '0',
        humidity: (weatherData.current?.humidity ?? 0).toString(),
        pressure: (weatherData.current?.pressure ?? 0).toString(),
        clouds: (weatherData.current?.clouds ?? 0).toString(),
        windSpeed: (weatherData.current?.windSpeed ?? 0.0).toString(),
      );

      if (weatherData.hourly != null) {
        for (var hourlyData in weatherData.hourly!) {
          final date = DateTime.fromMillisecondsSinceEpoch((hourlyData.dt ?? 0) * 1000);

          final day = DateFormat.MMMd().format(date);
          final time = DateFormat.Hm().format(date);

          final hourlyDataEntity = HourlyDataEntity(
            iconName: hourlyData.weather?.first.icon ?? Assets.icons.weather.w01d.path,
            day: day,
            time: time,
            weatherStatus: hourlyData.weather?.first.description ?? '',
            temperature: (hourlyData.temp?.truncate().toString()) ?? '0',
            humidity: hourlyData.humidity.toString(),
            pressure: hourlyData.pressure.toString(),
            clouds: hourlyData.clouds.toString(),
            visibility: hourlyData.visibility.toString(),
            windSpeed: hourlyData.windSpeed.toString(),
          );

          hourlyDataList.add(hourlyDataEntity);
        }
      }

      if (weatherData.daily != null) {
        for (var dailyData in weatherData.daily!) {
          final date = DateTime.fromMillisecondsSinceEpoch((dailyData.dt ?? 0) * 1000);

          final day = DateFormat.MMMd().format(date);

          final dailyDataEntity = DailyDataEntity(
            iconName: dailyData.weather?.first.icon ?? Assets.icons.weather.w01d.path,
            day: day,
            weatherStatus: dailyData.weather?.first.description ?? '',
            dayTemperature: (dailyData.temp?.day?.truncate().toString()) ?? '0',
            nightTemperature: (dailyData.temp?.night?.truncate().toString()) ?? '0',
            morningTemperature: (dailyData.temp?.morn?.truncate().toString()) ?? '0',
            eveningTemperature: (dailyData.temp?.eve?.truncate().toString()) ?? '0',
            humidity: dailyData.humidity.toString(),
            pressure: dailyData.pressure.toString(),
            clouds: dailyData.clouds.toString(),
            sunrise: dailyData.sunrise.toString(),
            sunset: dailyData.sunset.toString(),
            moonrise: dailyData.moonrise.toString(),
            moonset: dailyData.moonset.toString(),
            windSpeed: dailyData.windSpeed.toString(),
          );

          dailyDataList.add(dailyDataEntity);
        }
      }

      return WeatherDataEntity(
        locationText: weatherData.timezone ?? '',
        currentWeatherEntity: currentWeatherEntity,
        hourlyDataList: hourlyDataList,
        dailyDataList: dailyDataList,
      );
    } else {
      return WeatherDataEntity(
        locationText: '',
        currentWeatherEntity: CurrentWeatherEntity(
          iconName: Assets.icons.weather.w01d.path,
          weatherStatus: '-',
          temperature: '0',
          humidity: '0',
          pressure: '0',
          clouds: '0',
          windSpeed: '0',
        ),
        hourlyDataList: const [],
        dailyDataList: const [],
      );
    }
  }
}
