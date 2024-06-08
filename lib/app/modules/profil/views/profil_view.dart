import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          centerTitle: true,
        ),
        body: profilView());
  }
}

Widget profilView() {
  return ListView(
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: Image.asset('assets/img/digital.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Iznsraa',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
