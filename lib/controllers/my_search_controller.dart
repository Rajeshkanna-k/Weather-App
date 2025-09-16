import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/city.dart';

class MySearchController extends GetxController {
  late Box<String> _box;

  // Observable list of city history
  RxList<City> history = <City>[].obs;

  @override
  void onInit() {
    super.onInit();
    _box = Hive.box<String>('search_history');
    _loadHistory();
  }

  void _loadHistory() {
    final stored = _box.values.toList();
    history.assignAll(stored.map((e) => City.fromStorage(e)));
  }

  void addToHistory(City city) {
    if (city.name.trim().isEmpty) return;
    _box.add(city.toStorage());
    _loadHistory();
  }
}
