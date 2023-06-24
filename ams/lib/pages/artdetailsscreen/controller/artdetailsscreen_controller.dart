import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:ams/pages/homescreen/model/homescreen_model.dart';
import 'package:get/get.dart';

import '../../artofartistscreen/controller/art_of_artist_controller.dart';

class ArtDetailsScreenController extends GetxController {
  RxString artId = "".obs;
  RxString artistId = "".obs;

  ArtStores artDetails = ArtStores(
      isLike: false.obs,
      isSelected: true.obs,
      date: ArtStoreDate(createdAt: DateTime.now()),
      address: Address(
          coordinates: Coordinates(latitude: "", longitude: ""), name: ""),
      id: "",
      accountId: "",
      price: 0,
      title: "",
      description: "",
      images: [],
      tags: [],
      availability: true,
      distanceBetween: "");
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    artId.value = await Get.arguments['artId'];
    artDetails = await Get.arguments['artDetails'];
    isLoading(false);
    print(artDetails.accountId);
    // getArtsDetail();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setToTrue() {
    if (Get.isRegistered<ArtOfArtist>() == true) {
      for (var i = 0;
          i < Get.find<ArtOfArtist>().artist_arts_list.length;
          i++) {
        if (Get.find<ArtOfArtist>().artist_arts_list[i].id == artId.value) {
          Get.find<ArtOfArtist>().artist_arts_list[i].isSelected.value = true;
        }
      }
    }
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>().artStores_masterList[i].id ==
          artId.value) {
        Get.find<HomeScreenController>()
            .artStores_masterList[i]
            .isSelected
            .value = true;
      }
    }
  }

  setToFalse() {
    if (Get.isRegistered<ArtOfArtist>() == true) {
      for (var i = 0;
          i < Get.find<ArtOfArtist>().artist_arts_list.length;
          i++) {
        if (Get.find<ArtOfArtist>().artist_arts_list[i].id == artId.value) {
          Get.find<ArtOfArtist>().artist_arts_list[i].isSelected.value = true;
        }
      }
    }
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>().artStores_masterList[i].id ==
          artId.value) {
        Get.find<HomeScreenController>()
            .artStores_masterList[i]
            .isSelected
            .value = true;
      }
    }
  }

  // getArtsDetail() async {
  //   var result = await Session.getArt(artId: artId.value);
  // }
}
