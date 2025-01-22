import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/component/carddata.dart';

import '../../../../component/card_cuaca.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (s) {
          final listData = [
            ModelListHidro(
              assets: 'assets/img/suhu.png',
              title: 'Suhu',
              value: s!.dataHidro?.suhu.toString() ?? '0',
            ),
            ModelListHidro(
              assets: 'assets/img/temp.png',
              title: 'Temperatur',
              value: '${s.dataHidro!.temperature}°',
            ),
            ModelListHidro(
              assets: 'assets/img/ph.png',
              title: 'Ph',
              value: s.dataHidro!.ph.toString(),
            ),
            ModelListHidro(
              assets: 'assets/img/hum.png',
              title: 'Kelembapan',
              value: s.dataHidro!.kelembaban.toString(),
            ),
          ];
          // controller.air.value = s.dataHidro!.air;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(width: 40),
                    Text(
                      'Hello Abdullah Asmara',
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      'Welcome to hydroponic',
                      style: context.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              cardCuaca(s.dataCuaca),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardAirPompa(
                      context: context,
                      title: "Pompa",
                      value: Obx(
                        () => Switch(
                          value: controller.lightState.value,
                          inactiveThumbColor: Colors.red,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.grey,
                          onChanged: (v) => controller.stateLight(v),
                        ),
                      ),
                    ),
                    cardAirPompa(
                      context: context,
                      title: "Air",
                      value: (controller.air.value == '0')
                          ? const Icon(Icons.water_drop, color: Colors.red)
                          : const Icon(Icons.water_drop, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      crossAxisCount: 2,
                    ),
                    itemCount: listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = listData[index];
                      return cardHidro(
                        assets: data.assets,
                        title: data.title,
                        value: data.value,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        onEmpty: const Text('kosong'),
        onError: (e) => Text('error $e'),
        onLoading: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Card cardAirPompa({
    required BuildContext context,
    required String title,
    required Widget value,
  }) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: Get.width * 0.44,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge,
              ),
              value,
            ],
          ),
        ),
      ),
    );
  }
}

class ModelListHidro {
  final String assets;
  final String title;
  final String value;
  ModelListHidro(
      {required this.assets, required this.title, required this.value});
}
