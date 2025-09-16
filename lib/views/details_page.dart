import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class DetailsPage extends StatelessWidget {
  final String city;
  const DetailsPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final wc = Get.find<WeatherController>();
    final w = wc.citiesWeather[city];

    return Scaffold(
      appBar: AppBar(title: Text('$city details')),
      body: w == null
          ? const Center(child: Text('No data'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${w.cityName} — ${w.temp}°C',
                      style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 8),
                  Text('Desc: ${w.description}'),
                  Text('Min: ${w.tempMin}  Max: ${w.tempMax}'),
                  Text('Humidity: ${w.humidity}%'),
                  Text('Wind: ${w.windSpeed} m/s'),
                ],
              ),
            ),
    );
  }
}
