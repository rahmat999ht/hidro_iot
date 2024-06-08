import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/cuaca.dart';
import 'package:hidroponik_iot/app/model/hidro.dart';
import 'package:hidroponik_iot/app/providers/cuaca_prov.dart';

class HomeController extends GetxController with StateMixin<ModelHome> {
  final CuacaProvider cuacaProv;

  HomeController({required this.cuacaProv});

  ModelListHidro? data;

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  // final HidroponicModel dataHidro = <HidroponicModel>{};
  final HidroponicModel dataHidro = HidroponicModel();

  Future getSensor() async {
    final hidro = await ref.child('sensor').get();
    final cuaca = await cuacaProv.getCuaca();
    if (hidro.exists && cuaca.statusCode == 200) {
      final dataHidro = Map<String, dynamic>.from(hidro.value as Map);

      if (dataHidro.isEmpty && cuaca.bodyString == null) {
        change(
          ModelHome(
            dataHidro: HidroponicModel.fromJson({}),
            dataCuaca: CuacaModel.fromJson({}),
          ),
          status: RxStatus.empty(),
        );
      }
      change(
        ModelHome(
          dataHidro: HidroponicModel.fromJson(dataHidro),
          dataCuaca: cuacaModelFromJson(cuaca.bodyString!),
        ),
        status: RxStatus.success(),
      );
      log(data.toString(), name: 'get data');
    } else {
      log('No data available.', name: 'get error');
      change(null, status: RxStatus.error());
    }
  }

  // Future getCuacaMakassar() async {
  //   cuacaProv.getCuaca().then((result) {
  //     if (result.cod == 200) {
  //       log(result.toString(), name: 'data model');
  //       change(
  //         ModelHome(dataCuaca: cuacaModelFromJson(result.toString())),
  //         status: RxStatus.success(),
  //       );
  //     } else {
  //       change(
  //         ModelHome(dataCuaca: CuacaModel.fromJson({})),
  //         status: RxStatus.empty(),
  //       );
  //     }
  //   }, onError: (err) {
  //     log(err.toString(), name: 'findCuacaMakassar err');
  //     change(null, status: RxStatus.error(err.toString()));
  //   });
  // }

  @override
  void onInit() {
    //wais
    //yayat
    getSensor();
    super.onInit();
  }
}

class ModelHome {
  final HidroponicModel? dataHidro;
  final CuacaModel? dataCuaca;

  ModelHome({this.dataHidro, this.dataCuaca});
}
