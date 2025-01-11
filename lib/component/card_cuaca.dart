import 'package:flutter/material.dart';
import 'package:hidroponik_iot/app/model/cuaca.dart';
import 'package:hidroponik_iot/component/weather_detail.dart';

Widget cardCuaca(CuacaModel? data) {
  if (data == null) {
    return const SizedBox(
      height: 300,
      child: CircularProgressIndicator(),
    );
  }
  return SizedBox(
    height: 220,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.wb_cloudy_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.weather[0].main}°',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Text(
                      'Makassar, Indonesia',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  width: 45,
                ),
                const Spacer(),
                Text(
                  '${data.clouds.all}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherDetail(
                  label: 'Temperature',
                  value: '${data.main.temp}',
                ),
                WeatherDetail(
                  label: 'Temp. Max',
                  value: '${data.main.tempMin}',
                ),
                WeatherDetail(
                  label: 'Temp. Min',
                  value: '${data.main.tempMax}',
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
