import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final double? temp;
  final String? description;
  final VoidCallback? onTap;

  const CityCard({
    super.key,
    required this.cityName,
    this.temp,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        onTap: onTap,
        title: Text(cityName),
        subtitle: Text(description ?? '—'),
        trailing: Text(temp != null ? '${temp!.round()}°C' : '—'),
      ),
    );
  }
}
