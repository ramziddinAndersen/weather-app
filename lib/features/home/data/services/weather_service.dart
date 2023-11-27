import 'package:chopper/chopper.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/weather_full_data/weather_full_data.dart';

part 'weather_service.chopper.dart';

@ChopperApi()
abstract class WeatherService extends ChopperService {
  static WeatherService create([ChopperClient? client]) =>
      _$WeatherService(client ?? ChopperClient());

  @Get(
    path:
        'data/2.5/onecall?appid=${AppConstants.openWeatherKey}&lang=en&exclude=minutely,alerts&lat={lat}&lon={lon}&units={units}',
  )
  Future<Response<WeatherFullDataResponse>> getWeatherData({
    @Path('lat') required double lat,
    @Path('lon') required double lon,
    @Path('units') required String units,
  });
}
