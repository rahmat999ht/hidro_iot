import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: controller.obx(
          (s) => Center(
            child: Text(
              'Ph : ${s?.ph}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          onEmpty: const Text('kosong'),
          onError: (e) => Text('error $e'),
          onLoading: const CircularProgressIndicator(),
        ));
  }
}
