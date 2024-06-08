import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/hidro.dart';
import 'package:hidroponik_iot/component/button.dart';
import 'package:hidroponik_iot/component/carddata.dart';
import 'package:hidroponik_iot/component/weather_detail.dart';
import 'package:hidroponik_iot/theme/extension_context.dart';

// import '../../../routes/app_pages.dart';
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
            const SizedBox(
              width: 40,
            ),
            const Text('WELLCOME TO MY HIDROPONIC'),
            ButtonKu(
                onTap: () {
                  // Get.toNamed(Routes.PROFIL);
                  context.goProfile();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Image.asset(
                    'assets/img/digital.png',
                    width: 40,
                    height: 40,
                  ),
                )),
          ],
        ),
      ),
      body: controller.obx(
        (s) {
          final listData = [
            ModelListHidro(
              assets: 'assets/img/digital.png',
              title: 'Digital',
              value: s!.digital.toString(),
            ),
            ModelListHidro(
              assets: 'assets/img/temperature.png',
              title: 'Temperatur',
              value: '${s.temperature}°',
            ),
            ModelListHidro(
              assets: 'assets/img/ph.png',
              title: 'Ph Matahari',
              value: s.ph.toString(),
            ),
            ModelListHidro(
              assets: 'assets/img/volt.png',
              title: 'Voltage',
              value: s.voltage.toString(),
            ),
          ];
          return Column(
            children: [
              cardCuaca(s),
              const SizedBox(
                height: 20,
              ),
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
