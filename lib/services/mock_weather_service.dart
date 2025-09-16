// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/weather.dart';
// import '../constants.dart';

// class WeatherService {
//   Future<Weather> fetchWeatherByCity(String city) async {
//     final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
//       'q': city,
//       'units': 'metric',
//       'appid': OWM_API_KEY,
//     });

//     final res = await http.get(uri);
//     if (res.statusCode == 200) {
//       final Map<String, dynamic> body = json.decode(res.body);
//       return Weather.fromOpenWeather(body);
//     } else {
//       throw Exception('Failed to load weather (${res.statusCode})');
//     }
//   }
// }
//
import 'dart:async';
import '../models/weather.dart';

class MockWeatherService {
  Future<Weather> fetchWeatherByCity(String city) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return Weather(
      cityName: city,
      temp: 28.0,
      tempMin: 24.0,
      tempMax: 31.0,
      description: 'Sunny',
      humidity: 60,
      windSpeed: 3.5,
    );
  }
}
