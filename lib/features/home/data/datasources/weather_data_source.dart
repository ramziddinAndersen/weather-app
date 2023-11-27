import 'dart:convert';

import '../../../../core/api/export.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/model/error_model.dart';
import '../models/weather_full_data/weather_full_data.dart';

abstract class WeatherDataSource {
  Future<WeatherFullDataResponse> getWeatherData({
    required double lat,
    required double lon,
    required String units,
  });
}

class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<WeatherFullDataResponse> getWeatherData({
    required double lat,
    required double lon,
    required String units,
  }) async {
    final response = await ApiProvider.weatherService.getWeatherData(
      lat: lat,
      lon: lon,
      units: units,
    );

    final data = response.body;

    if (response.isSuccessful) {
      if (data != null) {
        return data;
      } else {
        throw const ServerException(message: 'Failed');
      }
    } else {
      final error = ErrorModel.fromJson(json.decode(response.error.toString()));

      throw ServerException(message: error.message);
    }
  }
}
