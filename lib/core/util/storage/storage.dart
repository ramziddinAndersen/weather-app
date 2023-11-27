import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/home/data/models/weather_full_data/weather_full_data.dart';

void saveWeatherData(WeatherFullDataResponse weatherData) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/weatherData.txt');

  await file.writeAsString(jsonEncode(weatherData));
}

Future<WeatherFullDataResponse?> readWeatherData() async {
  WeatherFullDataResponse result;

  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/weatherData.txt');
    final text = await file.readAsString();
    final data = jsonDecode(text);

    final map = Map<String, dynamic>.from(data);
    result = WeatherFullDataResponse.fromJson(map);

    return result;
  } catch (e) {
    debugPrint("Couldn't read file");
    return null;
  }
}
