import 'dart:convert';

import '../../../../core/api/export.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/model/error_model.dart';
import '../models/geo_coding/geo_coding.dart';

abstract class GeoDataDataSource {
  Future<List<GeoCodingResponse>> getGeoDataFromCityName({required String cityName});
}

class GeoDataDataSourceImpl implements GeoDataDataSource {
  @override
  Future<List<GeoCodingResponse>> getGeoDataFromCityName({required String cityName}) async {
    final response = await ApiProvider.geoCodingService.getCityGeoCoding(cityName);
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
