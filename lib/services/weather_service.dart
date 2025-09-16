import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../constants.dart'; // contains OWM_API_KEY

class WeatherService {
  Future<Weather> fetchWeatherByCity(String city) async {
    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': city,
        'units': 'metric',
        'appid': owmApiKey, // 👈 fixed constant name
      },
    );

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      final Map body = json.decode(res.body);

      return Weather(
        cityName: body['name'],
        temp: (body['main']['temp'] as num).toDouble(),
        tempMin: (body['main']['temp_min'] as num).toDouble(),
        tempMax: (body['main']['temp_max'] as num).toDouble(),
        description: (body['weather'] as List).first['description'],
        humidity: (body['main']['humidity'] as num).toInt(),
        windSpeed: (body['wind']?['speed'] ?? 0).toDouble(),
      );
    } else {
      throw Exception('Failed: ${res.statusCode} → ${res.body}');
    }
  }
}
