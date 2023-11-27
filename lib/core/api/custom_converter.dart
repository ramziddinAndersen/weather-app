import 'package:chopper/chopper.dart';

import '../../features/home/data/models/current_weather/current_weather.dart';
import '../../features/home/data/models/daily_weather/daily_weather.dart';
import '../../features/home/data/models/feels_like/feels_like.dart';
import '../../features/home/data/models/geo_coding/geo_coding.dart';
import '../../features/home/data/models/hourly_weather/hourly_weather.dart';
import '../../features/home/data/models/temperature/temperature.dart';
import '../../features/home/data/models/weather/weather.dart';
import '../../features/home/data/models/weather_full_data/weather_full_data.dart';

class CustomDataConverter extends JsonConverter {
  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) async {
    final dynamicResponse = await super.convertResponse(response);
    var body = dynamicResponse.body;

    final BodyType customBody = _convertToCustomObject<BodyType, InnerType>(body);

    return dynamicResponse.copyWith<BodyType>(
      body: customBody,
    );
  }

  dynamic _convertToCustomObject<BodyType, SingleItemType>(dynamic element) {
    if (element is List) {
      return _deserializeListOf<BodyType, SingleItemType>(element);
    } else {
      return _deserialize<SingleItemType>(element);
    }
  }

  dynamic _deserializeListOf<BodyType, SingleItemType>(
    List dynamicList,
  ) {
    List<SingleItemType> list = dynamicList
        .map<SingleItemType>((element) => _deserialize<SingleItemType>(element))
        .toList();
    return list;
  }

  dynamic _deserialize<SingleItemType>(Map<String, dynamic> json) {
    switch (SingleItemType) {
      case CurrentWeatherResponse:
        return CurrentWeatherResponse.fromJson(json);
      case DailyWeatherResponse:
        return DailyWeatherResponse.fromJson(json);
      case FeelsLikeResponse:
        return FeelsLikeResponse.fromJson(json);
      case GeoCodingResponse:
        return GeoCodingResponse.fromJson(json);
      case HourlyWeatherResponse:
        return HourlyWeatherResponse.fromJson(json);
      case TemperatureResponse:
        return TemperatureResponse.fromJson(json);
      case WeatherFullDataResponse:
        return WeatherFullDataResponse.fromJson(json);
      case WeatherResponse:
        return WeatherResponse.fromJson(json);
      default:
        return null;
    }
  }
}
