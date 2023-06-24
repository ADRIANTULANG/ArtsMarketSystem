import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../services/location_services.dart';
import '../controller/registration_controller.dart';
// import '../controller/createprofile_controller.dart';

class RegistrationGoogleMaps extends GetView<RegistrationController> {
  const RegistrationGoogleMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Obx(
            () => GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(Get.find<LocationServices>().user_latitude,
                    Get.find<LocationServices>().user_longitude),
                zoom: 10.4746,
              ),
              onTap: (LatLng location) {
                controller.ontap_GoogleMap(
                    latitude: location.latitude, longitude: location.longitude);
              },
              markers: Set<Marker>.of(controller.markers),
              onMapCreated: (GoogleMapController googlemapcontroller) {
                if (controller.mapcontroller.isCompleted == true) {
                  controller.mapcontroller.complete(googlemapcontroller);
                } else {}
                controller.googleMapController = googlemapcontroller;
              },
            ),
          ),
          Obx(
            () => controller.isLoadingRegistering.value == false
                ? InkWell(
                    onTap: () {
                      // controller.isLoadingRegistering.value = true;
                      // controller.verifiyNumber();
                      controller.register();
                    },
                    child: Container(
                      height: 10.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      child: Container(
                        height: 8.h,
                        width: 80.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "SET",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 10.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Container(
                      height: 8.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
