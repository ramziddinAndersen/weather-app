import '../../../gen/assets.gen.dart';
import '../validator/validators.dart';

String getWeatherAppIcon({required String? iconName}) {
  if (!Validators.isStringNotEmpty(iconName)) {
    return Assets.icons.weather.w01d.path;
  }

  switch (iconName) {
    case '01d':
      return Assets.icons.weather.w01d.path;
    case '02d':
      return Assets.icons.weather.w02d.path;
    case '03d':
      return Assets.icons.weather.w03d.path;
    case '04d':
      return Assets.icons.weather.w04d.path;
    case '09d':
      return Assets.icons.weather.w09d.path;
    case '10d':
      return Assets.icons.weather.w10d.path;
    case '11d':
      return Assets.icons.weather.w11d.path;
    case '13d':
      return Assets.icons.weather.w13d.path;
    case '50d':
      return Assets.icons.weather.w50d.path;
    case '01n':
      return Assets.icons.weather.w01n.path;
    case '02n':
      return Assets.icons.weather.w02n.path;
    case '03n':
      return Assets.icons.weather.w03n.path;
    case '04n':
      return Assets.icons.weather.w04n.path;
    case '09n':
      return Assets.icons.weather.w09n.path;
    case '10n':
      return Assets.icons.weather.w10n.path;
    case '11n':
      return Assets.icons.weather.w11n.path;
    case '13n':
      return Assets.icons.weather.w13n.path;
    case '50n':
      return Assets.icons.weather.w50n.path;

    default:
      return Assets.icons.weather.w01d.path;
  }
}
