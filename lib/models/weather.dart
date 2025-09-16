class Weather {
  final String cityName;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String description;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });
}
