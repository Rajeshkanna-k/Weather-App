import 'package:get/get.dart';
import '../models/weather.dart';
import '../services/weather_service.dart'; // 👈 use real service now

class WeatherController extends GetxController {
  var varOcg = ''.obs; // required variable name
  final WeatherService _service =
      WeatherService(); // 👈 switched from Mock to Real

  final RxMap<String, Weather> citiesWeather = <String, Weather>{}.obs;
  var loading = false.obs;
  var error = ''.obs;

  Future<void> fetchForCity(String city) async {
    loading.value = true;
    error.value = '';
    try {
      final w = await _service.fetchWeatherByCity(city);
      citiesWeather[city] = w;
      varOcg.value = city; // track last fetched city
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}
