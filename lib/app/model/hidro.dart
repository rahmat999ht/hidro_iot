// To parse this JSON data, do
//
//     final hidroponicModel = hidroponicModelFromJson(jsonString);

import 'dart:convert';

HidroponicModel hidroponicModelFromJson(String str) =>
    HidroponicModel.fromJson(json.decode(str));

String hidroponicModelToJson(HidroponicModel data) =>
    json.encode(data.toJson());

class HidroponicModel {
  double? suhu;
  int? kelembaban;
  double? ph;
  int? temperature;
  double? voltage;

  HidroponicModel({
    this.suhu,
    this.kelembaban,
    this.ph,
    this.temperature,
    this.voltage,
  });

  factory HidroponicModel.fromJson(Map<String, dynamic> json) =>
      HidroponicModel(
        suhu: json["suhu"],
        kelembaban: json["kelembaban"],
        ph: json["ph"]?.toDouble(),
        temperature: json["temperature"],
        voltage: json["voltage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "suhu": suhu,
        "kelembaban": kelembaban,
        "ph": ph,
        "temperature": temperature,
        "voltage": voltage,
      };
}

class ModelListHidro {
  final String assets;
  final String title;
  final String value;
  ModelListHidro(
      {required this.assets, required this.title, required this.value});
}
