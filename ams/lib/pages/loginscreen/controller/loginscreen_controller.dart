import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/session_services.dart';
import '../../../services/storage_services.dart';
import '../../homescreen/view/homescreen_view.dart';

class LoginController extends GetxController {
  RxBool isPasswordObscure = true.obs;
  RxBool isGettingCredentials = false.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    isGettingCredentials(true);
    var result =
        await Session.login(username: username.text, password: password.text);
    if (result != false) {
      print(result);
      print(result['accountId']);
      print(result['email']);
      Get.find<StorageServices>().saveCredentials(
          accntId: result['accountId'],
          email: result['email'],
          password: password.text);
      Get.offAll(() => HomeScreenView());
    } else {
      Get.snackbar(
        "Message",
        "Oops.. Something is wrong or user did not exist!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isGettingCredentials(false);
  }
}
