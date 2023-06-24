import 'package:ams/services/session_services.dart';
import 'package:get/get.dart';

import '../model/purchasehistory_model.dart';

class PurchaseHistoryController extends GetxController {
  RxList<History> historyList = <History>[].obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await getHistory();
    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getHistory() async {
    var result = await Session.getHistory();
    historyList.assignAll(result);
  }
}
