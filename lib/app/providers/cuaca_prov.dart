import 'dart:developer';

import 'package:get/get.dart';
import 'package:hidroponik_iot/app/model/cuaca.dart';

class CuacaProvider extends GetConnect {
  final String baseURL = 'https://api.openweathermap.org/';

  Future<CuacaModel> getCuaca() async {
    final queryParameter = {
      'q': 'Makassar',
      'appid': '1fe5f03e8b679377cbc41601289edfdd',
      'units': 'metric'
    };

    try {
      final response = await get('data/2.5/weather', query: queryParameter);
      if (response.status.hasError) {
        log(response.toString(), name: 'data error');
        return Future.error(response);
      } else {
        log(response.bodyString!, name: 'data response');
        return cuacaModelFromJson(response.bodyString!);
      }
    } catch (error) {
      log(error.toString(), name: "data error");
      throw 'Error getting products: $error';
    }
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }
}
