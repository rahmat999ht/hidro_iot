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
  final light = ''.obs;
  final lightState = true.obs;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  stateLight(bool value) {
    lightState.value = value;
    // Update nilai pompa di Firebase (0 untuk mati, 1 untuk nyala)
    ref.child('sensor').update({'pompa': value ? '1' : '0'}).then((_) {
      log('Pompa updated to ${value ? '1' : '0'}', name: 'Firebase');
    }).catchError((error) {
      log('Failed to update pompa: $error', name: 'Firebase');
    });
  }

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
          light.value = dataHidro['pompa'].toString();
          if (light.value == '0') {
            lightState.value = false;
          } else {
            lightState.value = true;
          }
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
