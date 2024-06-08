import 'package:flutter/material.dart';
import 'package:hidroponik_iot/app/model/cuaca.dart';

Widget cardCuaca(CuacaModel? s) {
  if (s == null) {
    return const SizedBox(
      height: 300,
      child: CircularProgressIndicator(),
    );
  }
  return SizedBox(
    height: 300,
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Berawan',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Makassar, Indonesia',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  width: 45,
                ),
                Text(
                  '${s.main.tempMax}°',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     WeatherDetail(label: 'Digital', value: '${s.digital}'),
            //     WeatherDetail(label: 'Ph', value: '${s.ph}'),
            //     WeatherDetail(label: 'Temperature', value: '${s.temperature}'),
            //     WeatherDetail(label: 'Voltage', value: '${s.voltage}'),
            //   ],
            // )
          ],
        ),
      ),
    ),
  );
}
