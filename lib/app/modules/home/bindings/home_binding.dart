import 'package:get/get.dart';
import 'package:hidroponik_iot/app/providers/cuaca_prov.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CuacaProvider());
    Get.put<HomeController>(
      HomeController(cuacaProv: Get.find()),
    );
  }
}
