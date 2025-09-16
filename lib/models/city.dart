// lib/models/city.dart

/// Simple model to represent a city.
/// This will be useful for search and Hive history.
class City {
  final String name;

  City({required this.name});

  // Convert City -> String (for Hive storage)
  String toStorage() => name;

  // Convert String -> City
  factory City.fromStorage(String value) => City(name: value);
}
