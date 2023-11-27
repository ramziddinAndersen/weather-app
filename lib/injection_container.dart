import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/router/app_router.dart';
import 'features/home/data/datasources/geo_data_data_source.dart';
import 'features/home/data/datasources/weather_data_source.dart';
import 'features/home/data/repositories/geo_data_repository_impl.dart';
import 'features/home/data/repositories/weather_repository_impl.dart';
import 'features/home/domain/repositories/geo_data_repository.dart';
import 'features/home/domain/repositories/weather_repository.dart';
import 'features/home/domain/usecases/get_geo_data_from_city_name_use_case.dart';
import 'features/home/domain/usecases/get_weather_data_use_case.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  //Bloc
  sl
    ..registerFactory(
        () => HomeCubit(getWeatherDataUseCase: sl(), geoDataFromCityNameUseCase: sl()))

    // Use cases
    ..registerFactory(() => GetWeatherDataUseCase(sl()))
    ..registerFactory(() => GetGeoDataFromCityNameUseCase(sl()))

    // Repository
    ..registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(sl(), sl()),
    )
    ..registerFactory<GeoDataRepository>(
      () => GeoDataRepositoryImpl(sl(), sl()),
    )

    // Data sources
    ..registerFactory<WeatherDataSource>(
      WeatherDataSourceImpl.new,
    )
    ..registerFactory<GeoDataDataSource>(
      GeoDataDataSourceImpl.new,
    )

    // //! Core
    ..registerLazySingleton(AppRouter.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))

    //! External
    ..registerLazySingleton(InternetConnectionChecker.new);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
