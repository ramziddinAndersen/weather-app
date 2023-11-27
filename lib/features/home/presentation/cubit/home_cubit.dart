import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/geo_location/geo_location.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/daily_data_entity.dart';
import '../../domain/entities/hourly_data_entity.dart';
import '../../domain/entities/weather_type_entity.dart';
import '../../domain/usecases/get_geo_data_from_city_name_use_case.dart';
import '../../domain/usecases/get_weather_data_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetGeoDataFromCityNameUseCase geoDataFromCityNameUseCase;
  final GetWeatherDataUseCase getWeatherDataUseCase;

  HomeCubit({
    required this.geoDataFromCityNameUseCase,
    required this.getWeatherDataUseCase,
  }) : super(HomeState.initial());

  void clear() {
    emit(state.copyWith(errorText: ''));
  }

  void getGeoDataFromCityName({required String cityName}) async {
    emit(state.copyWith(isLoading: true));

    final failureOrSuccess = await geoDataFromCityNameUseCase
        .getGeoDataFromCityName(GetGeoDataFromCityNameParams(cityName: cityName));

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorText: failure.message)),
      (data) {
        final lat = data.lat;
        final lon = data.lon;

        loadWeatherDataForCurrentLocation(latitude: lat, longitude: lon);
      },
    );
  }

  void loadWeatherDataForCurrentLocation({double? latitude, double? longitude}) async {
    emit(state.copyWith(isLoading: true));

    // Initial London location
    var lat = 51.5072;
    var lon = 0.1276;

    if (latitude == null || longitude == null) {
      try {
        final currentLocation = await getLocationData();
        lat = currentLocation.latitude;
        lon = currentLocation.longitude;
      } catch (e) {
        final error = e.toString();
        emit(state.copyWith(errorText: error));
      }
    } else {
      lat = latitude;
      lon = longitude;
    }

    final weatherDataFromServer = await getWeatherDataUseCase.getWeatherDataFromServer(
      GetWeatherDataParams(lat: lat, lon: lon, units: state.selectedUnitType),
    );

    // GET DATA FROM SERVER
    weatherDataFromServer.fold(
      (serverFailure) async {
        final weatherDataFromLocalFile = await getWeatherDataUseCase.getWeatherDataFromLocalFile(
          GetWeatherDataParams(lat: lat, lon: lon, units: state.selectedUnitType),
        );

        // GET DATA FROM LOCAL FILE
        weatherDataFromLocalFile.fold(
          (localFileFailure) async {
            state.copyWith(
              isLoading: false,
              errorText: localFileFailure.message,
            );
          },
          (data) => emit(
            state.copyWith(
              isLoading: false,
              errorText: serverFailure.message,
              locationText: data.locationText,
              currentWeatherEntity: data.currentWeatherEntity,
              hourlyDataList: data.hourlyDataList,
              dailyDataList: data.dailyDataList,
            ),
          ),
        );
      },
      (data) => emit(
        state.copyWith(
          isLoading: false,
          locationText: data.locationText,
          currentWeatherEntity: data.currentWeatherEntity,
          hourlyDataList: data.hourlyDataList,
          dailyDataList: data.dailyDataList,
        ),
      ),
    );
  }

  void changeWeatherType(WeatherTypeEntity type) {
    emit(state.copyWith(selectedWeatherType: type));
  }

  void changeUnitType(String? type) {
    emit(state.copyWith(selectedUnitType: type));

    loadWeatherDataForCurrentLocation();
  }
}
