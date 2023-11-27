import 'package:chopper/chopper.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/geo_coding/geo_coding.dart';

part 'geo_coding_service.chopper.dart';

@ChopperApi()
abstract class GeoCodingService extends ChopperService {
  static GeoCodingService create([ChopperClient? client]) =>
      _$GeoCodingService(client ?? ChopperClient());

  @Get(path: 'geo/1.0/direct?q={cityName}&limit=3&appid=${AppConstants.openWeatherKey}')
  Future<Response<List<GeoCodingResponse>>> getCityGeoCoding(
    @Path('cityName') String cityName,
  );
}
