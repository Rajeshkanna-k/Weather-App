import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';
import '../widgets/city_card.dart';
import 'details_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final WeatherController wc = Get.find();

  final List<String> predefined = ['Kochi', 'Chennai', 'Delhi'];

  @override
  Widget build(BuildContext context) {
    for (var city in predefined) {
      if (!wc.citiesWeather.containsKey(city)) {
        wc.fetchForCity(city);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => Get.to(() => const SearchPage()),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (wc.loading.value && wc.citiesWeather.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: predefined.map((city) {
            final w = wc.citiesWeather[city];
            return CityCard(
              cityName: city,
              temp: w?.temp,
              description: w?.description,
              onTap: () {
                Get.to(() => DetailsPage(city: city));
              },
            );
          }).toList(),
        );
      }),
    );
  }
}
