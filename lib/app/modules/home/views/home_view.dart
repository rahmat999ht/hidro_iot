import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/hidro.dart';
import 'package:hidroponik_iot/component/button.dart';
import 'package:hidroponik_iot/component/weather_detail.dart';
import 'package:hidroponik_iot/theme/extension_context.dart';

// import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: Image.asset(
                  'assets/img/logo.png',
                  width: 40,
                  height: 40,
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

  Padding cardCuaca(HidroponicModel s) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.wb_cloudy,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Berawan',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Makassar, Indonesia',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '22°',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherDetail(label: 'Digital', value: '${s.digital}'),
                WeatherDetail(label: 'Ph', value: '${s.ph}'),
                WeatherDetail(label: 'Temperature', value: '${s.temperature}'),
                WeatherDetail(label: 'Voltage', value: '${s.voltage}'),
              ],
            )
          ],
        ),
      ),
    );
  }

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
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 20),
              )
            ],
          )),
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
