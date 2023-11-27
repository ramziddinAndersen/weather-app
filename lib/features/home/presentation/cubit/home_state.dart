part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String locationText;
  final WeatherTypeEntity selectedWeatherType;
  final CurrentWeatherEntity currentWeatherEntity;
  final List<HourlyDataEntity> hourlyDataList;
  final List<DailyDataEntity> dailyDataList;
  final String selectedUnitType;
  final List<String> unitTypesList;
  final String errorText;
  final bool isLoading;

  const HomeState({
    required this.locationText,
    required this.selectedWeatherType,
    required this.currentWeatherEntity,
    required this.hourlyDataList,
    required this.dailyDataList,
    required this.selectedUnitType,
    required this.unitTypesList,
    this.errorText = '',
    this.isLoading = false,
  });

  factory HomeState.initial() {
    return HomeState(
      locationText: '',
      selectedWeatherType: const WeatherTypeEntity(type: 0, text: 'Hourly'),
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
      selectedUnitType: 'metric',
      unitTypesList: const ['metric', 'imperial'],
    );
  }

  HomeState copyWith({
    String? locationText,
    WeatherTypeEntity? selectedWeatherType,
    CurrentWeatherEntity? currentWeatherEntity,
    List<HourlyDataEntity>? hourlyDataList,
    List<DailyDataEntity>? dailyDataList,
    String? selectedUnitType,
    List<String>? unitTypesList,
    String? errorText,
    bool? isLoading,
  }) {
    return HomeState(
      locationText: locationText ?? this.locationText,
      selectedWeatherType: selectedWeatherType ?? this.selectedWeatherType,
      currentWeatherEntity: currentWeatherEntity ?? this.currentWeatherEntity,
      hourlyDataList: hourlyDataList ?? this.hourlyDataList,
      dailyDataList: dailyDataList ?? this.dailyDataList,
      selectedUnitType: selectedUnitType ?? this.selectedUnitType,
      unitTypesList: unitTypesList ?? this.unitTypesList,
      errorText: errorText ?? this.errorText,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        locationText,
        selectedWeatherType,
        currentWeatherEntity,
        hourlyDataList,
        dailyDataList,
        selectedUnitType,
        unitTypesList,
        errorText,
        isLoading,
      ];
}
