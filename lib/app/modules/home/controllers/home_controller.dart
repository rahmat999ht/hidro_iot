import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/hidro.dart';

class HomeController extends GetxController with StateMixin<HidroponicModel> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  // final HidroponicModel dataHidro = <HidroponicModel>{};
  final HidroponicModel dataHidro = HidroponicModel();
 
  Future getData() async {
    final snapshot = await ref.child('sensor').get();
    if (snapshot.exists) {
      // final data =  snapshot.value as Map<String, dynamic>;
      final data = Map<String, dynamic>.from(snapshot.value as Map);

      final dataJson = HidroponicModel.fromJson(data);
      if (data.isEmpty) {
        change(HidroponicModel(), status: RxStatus.empty());
      }
      change(dataJson, status: RxStatus.success());
      // HidroponicModel(digital:['digital']);
      log(dataJson.toString(), name: 'get data');
      log(data.toString(), name: 'get data');
    } else {
      log('No data available.', name: 'get error');
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    //wais
    getData();
    super.onInit();
  }
}
