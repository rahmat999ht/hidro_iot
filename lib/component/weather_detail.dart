import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  final String label;
  final String value;

  const WeatherDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
