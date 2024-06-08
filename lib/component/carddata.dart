import 'package:flutter/material.dart';

Container cardHidro({
  required String assets,
  required String title,
  required String value,
}) {
  return Container(
    width: 180,
    height: 180,
    decoration: BoxDecoration(
        color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            assets,
            height: 70,
            width: 70,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    ),
  );
}
