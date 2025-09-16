import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_search_controller.dart';
import '../controllers/weather_controller.dart';
import '../models/city.dart';
import 'details_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MySearchController sc = Get.find();
    final WeatherController wc = Get.find();
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Search City')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search input
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search city',
                hintText: 'Enter city name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) async {
                if (value.trim().isEmpty) return;
                final city = City(name: value);
                await wc.fetchForCity(city.name); // fetch weather
                sc.addToHistory(city); // save to Hive
                Get.to(() => DetailsPage(city: city.name));
              },
            ),
            const SizedBox(height: 16),

            // 🔄 Search history
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search History',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                if (sc.history.isEmpty) {
                  return const Text('No history yet.');
                }
                return ListView.builder(
                  itemCount: sc.history.length,
                  itemBuilder: (_, i) {
                    final city = sc.history[i];
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(city.name),
                      onTap: () async {
                        await wc.fetchForCity(city.name);
                        Get.to(() => DetailsPage(city: city.name));
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
