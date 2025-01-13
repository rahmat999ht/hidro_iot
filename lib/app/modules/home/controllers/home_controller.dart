import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/cuaca.dart';
import 'package:hidroponik_iot/app/model/hidro.dart';
import 'package:hidroponik_iot/app/providers/cuaca_prov.dart';

class HomeController extends GetxController with StateMixin<ModelHome> {
  final CuacaProvider cuacaProv;

  HomeController({required this.cuacaProv});

  final air = ''.obs; // Nilai reaktif untuk air
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<void> getSensor() async {
    final hidroRef = ref.child('sensor');
    final cuaca = await cuacaProv.getCuaca();

    if (cuaca.statusCode == 200) {
      // Listener untuk data sensor Firebase
      hidroRef.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.exists) {
          final data = event.snapshot.value as Map<dynamic, dynamic>;
          final dataHidro = Map<String, dynamic>.from(data);

          // Update nilai reaktif
          air.value = dataHidro['air'].toString();

          log(dataHidro.toString(), name: "hidro");
          log(cuaca.bodyString.toString(), name: "cuaca");

          // Update status data ke RxStatus.success
          change(
            ModelHome(
              dataHidro: HidroponicModel.fromJson(dataHidro),
              dataCuaca: cuacaModelFromJson(cuaca.bodyString!),
            ),
            status: RxStatus.success(),
          );
        } else {
          // Data kosong
          log("No sensor data available.", name: "hidro");
          change(null, status: RxStatus.empty());
        }
      });
    } else {
      log('Failed to fetch weather data.', name: 'cuaca');
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    getSensor();
    super.onInit();
  }
}

class ModelHome {
  final HidroponicModel? dataHidro;
  final CuacaModel? dataCuaca;

  ModelHome({this.dataHidro, this.dataCuaca});
}
