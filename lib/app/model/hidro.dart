// To parse this JSON data, do
//
//     final hidroponicModel = hidroponicModelFromJson(jsonString);

import 'dart:convert';

HidroponicModel hidroponicModelFromJson(String str) => HidroponicModel.fromJson(json.decode(str));

String hidroponicModelToJson(HidroponicModel data) => json.encode(data.toJson());

class HidroponicModel {
    final String pompa;
    final String ph;
    final int temperature;
    final String suhu;
    final String air;
    final String kelembaban;
    // final double voltage;

    HidroponicModel({
        required this.pompa,
        required this.ph,
        required this.temperature,
        required this.suhu,
        required this.air,
        required this.kelembaban,
        // required this.voltage,
    });

    HidroponicModel copyWith({
        String? pompa,
        String? ph,
        int? temperature,
        String? suhu,
        String? air,
        String? kelembaban,
        // double? voltage,
    }) => 
        HidroponicModel(
            pompa: pompa ?? this.pompa,
            ph: ph ?? this.ph,
            temperature: temperature ?? this.temperature,
            suhu: suhu ?? this.suhu,
            air: air ?? this.air,
            kelembaban: kelembaban ?? this.kelembaban,
            // voltage: voltage ?? this.voltage,
        );

    factory HidroponicModel.fromJson(Map<String, dynamic> json) => HidroponicModel(
        pompa: json["pompa"],
        ph: json["ph"],
        temperature: json["temperature"],
        suhu: json["suhu"],
        air: json["air"],
        kelembaban: json["kelembaban"],
        // voltage: json["voltage"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "pompa": pompa,
        "ph": ph,
        "temperature": temperature,
        "suhu": suhu,
        "air": air,
        "kelembaban": kelembaban,
        // "voltage": voltage,
    };
}
