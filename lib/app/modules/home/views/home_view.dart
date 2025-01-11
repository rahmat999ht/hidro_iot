import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/component/button.dart';
import 'package:hidroponik_iot/component/carddata.dart';
import 'package:hidroponik_iot/theme/extension_context.dart';

import '../../../../component/card_cuaca.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            const Text('WELLCOME TO MY HIDROPONIC'),
            ButtonKu(
              onTap: () {
                // Get.toNamed(Routes.PROFIL);
                context.goProfile();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
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
          return Column(
            children: [
              cardCuaca(s.dataCuaca),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
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
        onLoading: const CircularProgressIndicator(),
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
