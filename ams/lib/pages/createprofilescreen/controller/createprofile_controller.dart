import 'dart:async';

import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:ams/pages/profilescreen/controller/profilescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../../services/session_services.dart';
import '../model/createprofile_model.dart';

class CreateProfileViewController extends GetxController {
  final ImagePicker picker = ImagePicker();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController birthday = TextEditingController();

  RxBool isRegistering = false.obs;
  RxBool isLoadingRegistering = false.obs;
  RxString selectedDate = "Birthday".obs;

  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  double latitude_selected = 0.0;
  double longitude_selected = 0.0;

  XFile? image;

  RxString imagepath = "".obs;
  TextEditingController searchplace = TextEditingController();

  var googlePlace = GooglePlace("AIzaSyDv3BDMP_S6x1GWaVSTax3Naf4A301zW6s");
  RxList<PredictedPlaces> placesList = <PredictedPlaces>[].obs;

  Timer? debouncer;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    debouncer?.cancel();
    super.onClose();
  }

  searchPlaces({required String place}) async {
    placesList.clear();
    AutocompleteResponse? result = await googlePlace.autocomplete.get(place);

    if (result != null) {
      if (result.status != "REQUEST_DENIED") {
        for (var i = 0; i < result.predictions!.length; i++) {
          print(result.predictions![i].description);
          List<geocoding.Location> locations = await geocoding
              .locationFromAddress(result.predictions![i].description!);
          print(locations[0].latitude);
          print(locations[0].longitude);
          placesList.add(PredictedPlaces(
              placename: result.predictions![i].description!,
              latitude: locations[0].latitude,
              longitude: locations[0].longitude));
        }
      } else {}
    }
  }

  openGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imagepath.value = image!.path;
  }

  openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    imagepath.value = image!.path;
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDate.value = DateFormat.yMMMMd().format(args.value);

    Get.back();
  }

  ontap_GoogleMap({required double latitude, required double longitude}) async {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId("new"),
      position: LatLng(latitude, longitude),
    ));
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(latitude, longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
    latitude_selected = latitude;
    longitude_selected = longitude;
  }

  createProfile() async {
    await Session.createProfile(
      firstname: firstname.text,
      lastname: lastname.text,
      addressname: address.text,
      latitude: latitude_selected.toString(),
      longitude: longitude_selected.toString(),
      birthdate: selectedDate.value,
      email: email.text,
      number: contact.text,
    );
    uploadImage();
  }

  uploadImage() async {
    var result = await Session.uploadImage(file: image!);

    if (result == true) {
      Get.back();
      Get.back();
      Get.back();
      Get.snackbar(
        "Message",
        "Succesfully Created",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.find<ProfileViewController>().getProfile();
      Get.find<HomeScreenController>().getProfile();
      isLoadingRegistering.value = false;
    } else {
      Get.snackbar(
        "Message",
        "Oopss.. Please try again later",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
