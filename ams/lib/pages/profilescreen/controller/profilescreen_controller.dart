import 'dart:async';

import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:ams/services/session_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import '../../createprofilescreen/model/createprofile_model.dart';
import '../../createprofilescreen/view/createprofile_views.dart';

class ProfileViewController extends GetxController {
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  TextEditingController textFirstName = TextEditingController();
  TextEditingController textLastname = TextEditingController();
  TextEditingController textaddressname = TextEditingController();
  TextEditingController textemail = TextEditingController();
  TextEditingController textcontact = TextEditingController();
  TextEditingController textbirthday = TextEditingController();

  RxString firstname = "".obs;
  RxString lastname = "".obs;
  RxString addressname = "".obs;
  RxString email = "".obs;
  RxString contact = "".obs;
  RxString birthday = "".obs;
  RxString userimage = "".obs;
  String latitude = "";
  String longitude = "";
  final ImagePicker picker = ImagePicker();

  RxBool isLoading = true.obs;

  XFile? image;

  RxString imagepath = "".obs;

  RxBool isUpdating = false.obs;

  RxBool isGettingAndUploadingIamge = false.obs;

  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  double latitude_selected = 0.0;
  double longitude_selected = 0.0;
  String address_selected = "";

  TextEditingController searchplace = TextEditingController();

  var googlePlace = GooglePlace("AIzaSyDv3BDMP_S6x1GWaVSTax3Naf4A301zW6s");
  RxList<PredictedPlaces> placesList = <PredictedPlaces>[].obs;

  Timer? debouncer;

  @override
  void onClose() {
    super.onClose();
  }

  getProfile() async {
    var result = await Session.getProfile();
    if (result == "create profile") {
      Get.to(() => CreateProfileView());
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
      if (result['address']['coordinates']['latitude'] != null) {
        latitude = await result['address']['coordinates']['latitude'];
        longitude = await result['address']['coordinates']['longitude'];
      }

      textFirstName.text = firstname.value;
      textLastname.text = lastname.value;
      textaddressname.text = addressname.value;
      textemail.text = email.value;
      textcontact.text = contact.value;
      textbirthday.text = birthday.value;
    }
    isLoading(false);
  }

  openCamera() async {
    isGettingAndUploadingIamge(true);
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath.value = image!.path;
      await uploadImage(file: image!);
    }
    isGettingAndUploadingIamge(false);
  }

  uploadImage({required XFile file}) async {
    var result = await Session.uploadImage(file: file);
    print("result: $result");
    if (result == true) {
      await getProfile();
      Get.snackbar(
        "Message",
        "Profile updated",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
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

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    Get.back();
    birthday.value = await DateFormat.yMMMMd().format(args.value);
  }

  updateProfile() async {
    isUpdating(true);
    var result = await Session.updateProfile(
        firstname: textFirstName.text,
        lastname: textLastname.text,
        email: textemail.text,
        number: textcontact.text);
    print("result ${result}");
    if (result == true) {
      var resultnew = await updateProfileAddress(
          addressname: textaddressname.text,
          latitude: latitude,
          longitude: longitude);
      print("resultnew $resultnew");
      if (resultnew == true) {
        getProfile();
        Get.find<HomeScreenController>().getProfile();
        print("called");
        Get.snackbar(
          "Message",
          "Profile Updated!",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    isUpdating(false);
  }

  updateProfileAddress(
      {required String addressname,
      required String latitude,
      required String longitude}) async {
    var result = await Session.updateProfileAddress(
        addressname: addressname, latitude: latitude, longitude: longitude);
    return result;
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
}
