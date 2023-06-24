import 'dart:async';

import 'package:ams/pages/loginscreen/view/loginview_view.dart';
import 'package:ams/services/storage_services.dart';
import 'package:get/get.dart';

import '../../../services/session_services.dart';
import '../../homescreen/view/homescreen_view.dart';
import '../../termsandconditionsscreen/view/terms_and_condition_screen_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateToLogin();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  navigateToLogin() async {
    Timer(Duration(seconds: 5), () {
      if (Get.find<StorageServices>().storage.read('email') == null) {
        if (Get.find<StorageServices>().storage.read('isAlreadyDisplay') ==
            null) {
          Get.offAll(() => TermsAndConditionScreenView());
        } else {
          Get.offAll(() => LoginView());
        }
      } else {
        reAuthenticate();
      }
    });
  }

  reAuthenticate() async {
    var result = await Session.reAuthencticate(
        username: Get.find<StorageServices>().storage.read('email'),
        password: Get.find<StorageServices>().storage.read('password'));
    if (result == true) {
      Get.offAll(() => HomeScreenView());
    } else {}
  }
}
