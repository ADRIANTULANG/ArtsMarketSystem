import 'dart:async';

import 'package:ams/services/session_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../model/artist_model.dart';
import '../model/homescreen_model.dart';

class HomeScreenController extends GetxController {
  TextEditingController search = TextEditingController();
  TextEditingController searchartist = TextEditingController();
  RxList<ArtStores> artStores = <ArtStores>[].obs;
  RxList<ArtStores> artStores_masterList = <ArtStores>[].obs;

  RxString firstname = "".obs;
  RxString lastname = "".obs;
  RxString addressname = "".obs;
  RxString email = "".obs;
  RxString contact = "".obs;
  RxString birthday = "".obs;
  RxString userimage = "".obs;

  RxBool isLoading = true.obs;

  RxBool isSwitched = false.obs;

  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  RxList<ArtistModel> artistList = <ArtistModel>[].obs;
  RxList<ArtistModel> artistList_MasterList = <ArtistModel>[].obs;
  @override
  void onInit() async {
    await getArtStore();
    await getProfile();
    await getArtist();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArtStore() async {
    var result = await Session.getArts();
    artStores.assignAll(result);
    artStores_masterList.assignAll(result);
  }

  getArtist() async {
    var result = await Session.getArtist();
    artistList.assignAll(result);
    artistList_MasterList.assignAll(result);
  }

  searchArt({required String word}) {
    if (word.isEmpty || word == "") {
      artStores.assignAll(artStores_masterList);
    } else {
      artStores.assignAll(artStores_masterList
          .where((u) => (u.title
                  .toString()
                  .toLowerCase()
                  .contains(word.toLowerCase()) ||
              u.address.toString().toLowerCase().contains(word.toLowerCase()) ||
              u.price.toString().toLowerCase().contains(word.toLowerCase())))
          .toList());
    }
  }

  searchArtist({required String word}) {
    if (word.isEmpty || word == "") {
      artistList.assignAll(artistList_MasterList);
    } else {
      artistList.assignAll(artistList_MasterList
          .where((u) => (u.name!.first
                  .toString()
                  .toLowerCase()
                  .contains(word.toLowerCase()) ||
              u.name!.last
                  .toString()
                  .toLowerCase()
                  .contains(word.toLowerCase())))
          .toList());
    }
  }

  getProfile() async {
    var result = await Session.getProfile();
    if (result == "create profile") {
    } else if (result == false) {
      Get.snackbar(
        "Message",
        "Oops.. Please try again later!",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // print(result);
      if (result['name']['first'] != null) {
        firstname.value = await result['name']['first'];
      }
      if (result['name']['last'] != null) {
        lastname.value = await result['name']['last'];
      }
      if (result['address']['name'] != null) {
        addressname.value = await result['address']['name'];
      }
      if (result['contact']['email'] != null) {
        email.value = await result['contact']['email'];
      }
      if (result['contact']['number'] != null) {
        contact.value = await result['contact']['number'];
      }

      if (result['birthdate'] != null) {
        birthday.value = await DateFormat.yMMMMd()
            .format(DateTime.parse(result['birthdate']));
      }
      if (result['avatar'] != null) {
        userimage.value = await result['avatar'];
      }
    }
  }

  getCenter(
      {required LatLng currentLatlng,
      required LatLng artLatLng,
      required String artname}) {
    LatLngBounds bounds =
        LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    if (artLatLng.latitude > currentLatlng.latitude &&
        artLatLng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(southwest: currentLatlng, northeast: artLatLng);
    } else if (artLatLng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(artLatLng.latitude, currentLatlng.longitude),
          northeast: LatLng(currentLatlng.latitude, artLatLng.longitude));
    } else if (artLatLng.latitude > currentLatlng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(currentLatlng.latitude, artLatLng.longitude),
          northeast: LatLng(artLatLng.latitude, currentLatlng.longitude));
    } else {
      bounds = LatLngBounds(southwest: artLatLng, northeast: currentLatlng);
    }

    markers.clear();
    markers.add(Marker(
        markerId: MarkerId("artID"),
        position: artLatLng,
        infoWindow: InfoWindow(title: artname)));
    markers.add(Marker(
        markerId: MarkerId("myLocation"),
        position: currentLatlng,
        infoWindow: InfoWindow(title: "Your current location")));

    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 20.w));
  }

  String addTags({required List<String> list}) {
    String returnString = "";
    for (var i = 0; i < list.length; i++) {
      returnString = returnString + list[i];
    }
    return returnString;
  }

  RxString getLengthOfCart() {
    int count = 0;
    for (var i = 0; i < artStores_masterList.length; i++) {
      if (artStores_masterList[i].isSelected.value == true) {
        count = count + 1;
      }
    }
    return count.toString().obs;
  }
}
