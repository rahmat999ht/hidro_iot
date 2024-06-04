import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfilView'),
          centerTitle: true,
        ),
        body: profilView());
  }
}

Widget profilView() {
  return Center(
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
        )
      ],
    ),
  );
}
