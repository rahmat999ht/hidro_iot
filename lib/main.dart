import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidroponik_iot/firebase_options.dart';
import 'package:hidroponik_iot/theme/apptheme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var initialRoute = Routes.HOME;
    return GetMaterialApp(
      title: "Fresha",
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: AppTheme.dark,
      // theme: AppTheme.light,
      // builder: EasyLoading.init(),
    );
  }
}
