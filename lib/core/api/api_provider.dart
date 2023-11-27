import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;

import '../../features/home/data/services/geo_coding_service.dart';
import '../../features/home/data/services/weather_service.dart';
import '../constants/app_constants.dart';
import 'custom_converter.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late WeatherService weatherService;
  static late GeoCodingService geoCodingService;

  static create() {
    _client = ChopperClient(
      baseUrl: Uri.parse(AppConstants.apiBaseUrl),
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        WeatherService.create(),
        GeoCodingService.create(),
      ],
      interceptors: getInterceptors(),
      converter: CustomDataConverter(),
    );

    weatherService = _client.getService<WeatherService>();
    geoCodingService = _client.getService<GeoCodingService>();
  }

  static List getInterceptors() {
    final interceptors = [
      HttpLoggingInterceptor(),
      const HeadersInterceptor({
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
      }),
    ];

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
