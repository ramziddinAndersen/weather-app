class UnitsHelper {
  static String getTemperatureSign(String unitType) {
    if (unitType == 'metric') {
      return '°C';
    } else if (unitType == 'imperial') {
      return '°F';
    } else {
      return '';
    }
  }
}
