import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:ams/services/session_services.dart';
import 'package:get/get.dart';

import '../../homescreen/model/homescreen_model.dart';

class ArtOfArtist extends GetxController {
  RxString artist_id = ''.obs;
  RxString artist_name = ''.obs;
  RxString artist_Address = ''.obs;
  RxString artist_Number = ''.obs;
  RxString artist_image = ''.obs;
  RxString artist_email = ''.obs;
  RxList<ArtStores> artist_arts_list = <ArtStores>[].obs;
  RxList<ArtStores> artist_arts_list_master = <ArtStores>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    artist_id.value = await Get.arguments['artist_id'];
    artist_name.value = await Get.arguments['artist_name'];

    artist_email.value = await Get.arguments['artist_email'];
    artist_image.value = await Get.arguments['artist_image'];
    artist_Number.value = await Get.arguments['artist_Number'];
    artist_Address.value = await Get.arguments['artist_Address'];
    await getArtofArtist();
    await checkIfItemIsSelected();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArtofArtist() async {
    var result = await Session.getArtistArts(accountID: artist_id.value);
    artist_arts_list.assignAll(result);
    artist_arts_list_master.assignAll(result);
  }

  checkIfItemIsSelected() {
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      for (var x = 0; x < artist_arts_list.length; x++) {
        if (artist_arts_list[x].id ==
            Get.find<HomeScreenController>().artStores_masterList[i].id) {
          if (Get.find<HomeScreenController>()
                  .artStores_masterList[i]
                  .isSelected
                  .value ==
              true) {
            artist_arts_list[x].isSelected.value = true;
          } else {
            artist_arts_list[x].isSelected.value = false;
          }
        }
      }
    }
  }

  setToFalse({required String artid}) {
    for (var i = 0; i < artist_arts_list.length; i++) {
      if (artist_arts_list[i].id == artid) {
        artist_arts_list[i].isSelected.value = false;
      }
    }

    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>().artStores_masterList[i].id ==
          artid) {
        Get.find<HomeScreenController>()
            .artStores_masterList[i]
            .isSelected
            .value = false;
      }
    }
  }
}
