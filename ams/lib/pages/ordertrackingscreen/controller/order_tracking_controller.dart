import 'package:get/get.dart';

class OrdertrackingController extends GetxController {
  RxString image = ''.obs;
  RxString artistname = ''.obs;
  RxString artsPrice = ''.obs;
  RxString artDescription = ''.obs;
  RxString artTitle = ''.obs;
  @override
  void onInit() {
    image.value = Get.arguments["image"];
    artistname.value = Get.arguments["artistname"];
    artsPrice.value = Get.arguments["artsPrice"];
    artDescription.value = Get.arguments["artDescription"];
    artTitle.value = Get.arguments["artTitle"];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
