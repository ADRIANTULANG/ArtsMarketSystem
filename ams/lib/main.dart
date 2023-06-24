import 'package:ams/pages/splashscreen/view/splashscreen_view.dart';
import 'package:ams/services/headers_services.dart';
import 'package:ams/services/location_services.dart';
import 'package:ams/services/storage_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  await Get.put(HeadersServices());
  await Get.put(StorageServices());
  await Get.put(LocationServices());
  Stripe.publishableKey =
      'pk_test_51Lize7DbhTM8s4NtaeW6xZ1mqM2Oc49oHjJIxroDWyOCgAPOuFr0nHn1u4PF9OueNCeVGFJzxK82LjiZASTT8mip00g3Zk3ioN';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AMS',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashScreenView(),
      );
    });
  }
}
