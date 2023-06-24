import 'dart:async';

import 'package:ams/services/session_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../view/registration_otp_view.dart';

class RegistrationController extends GetxController {
  RxBool isRegistering = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String verifIDReceived = "";
  RxBool isChecking = false.obs;

  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;
  RxBool isLoadingRegistering = false.obs;
  double latitude_selected = 0.0;
  double longitude_selected = 0.0;

  RxString selectedDate = "Birthday".obs;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  final ImagePicker picker = ImagePicker();
  XFile? image;
  RxString imagepath = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    isChecking(true);
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        // uploadImage();
        await register();
        // controller.addUser(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  register() async {
    var result = await Session.register(
        username: username.text.trim().toString(),
        password: password.text.trim().toString());
    if (result == true) {
      Get.back();
      Get.back();
      Get.snackbar(
        "Message",
        "Account successfully created!",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      isChecking(false);
      // createProfile();
    } else {
      Get.back();
      Get.snackbar(
        "Message",
        "Username and password exist! \n please try again",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      isChecking(false);
    }
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
      number: contactnumber.text,
    );
    uploadImage();
  }

  uploadImage() async {
    var result = await Session.uploadImage(file: image!);
    if (result == true) {
      Get.snackbar(
        "Message",
        "SuccesfullY Created",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Message",
        "SuccesfullY Created",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  verifiyNumber() {
    isRegistering.value = true;
    auth.verifyPhoneNumber(
        // phoneNumber: "09367325510",
        phoneNumber: "+63${contactnumber.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are login successfully");
            print(value.credential);
            print("smsCode: ${credential.smsCode}");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verifIDReceived = verificationID;
          print(verificationID);
          print(resendToken);
          isRegistering.value = false;
          Get.to(() => RegistrationOtpView());
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: Duration(seconds: 60));
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDate.value = DateFormat.yMMMMd().format(args.value);

    Get.back();
  }

  openGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imagepath.value = image!.path;
  }

  openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    imagepath.value = image!.path;
  }
}
