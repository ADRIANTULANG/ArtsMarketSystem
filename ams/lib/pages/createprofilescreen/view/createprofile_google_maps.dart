import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../services/location_services.dart';
import '../controller/createprofile_controller.dart';

class CreateProfileGoogleMaps extends GetView<CreateProfileViewController> {
  const CreateProfileGoogleMaps({Key? key}) : super(key: key);

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
          Positioned(
            top: 7.h,
            child: Container(
              height: 8.h,
              width: 95.w,
              child: TextField(
                controller: controller.searchplace,
                obscureText: false,
                onChanged: (value) {
                  // controller.markers.clear();
                  // controller.searchArt(word: controller.search.text);
                  if (controller.debouncer?.isActive ?? false)
                    controller.debouncer?.cancel();
                  controller.debouncer =
                      Timer(const Duration(milliseconds: 1000), () {
                    if (controller.searchplace.text.isEmpty ||
                        controller.searchplace.text.trim() == "") {
                      controller.placesList.clear();
                    } else {
                      FocusScope.of(context).unfocus();
                      controller.searchPlaces(
                          place: controller.searchplace.text);
                    }
                    // do something with query
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.searchplace.clear();
                        // controller.artStores
                        //     .assignAll(controller.artStores_masterList);
                        controller.placesList.clear();
                      },
                      child: Icon(Icons.clear)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  labelText: 'Search',
                ),
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            child: Container(
              width: 95.w,
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.placesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        controller.ontap_GoogleMap(
                            latitude: controller.placesList[index].latitude,
                            longitude: controller.placesList[index].longitude);
                        controller.placesList.clear();
                        FocusScope.of(context).unfocus();
                        controller.searchplace.clear();
                      },
                      child: Container(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 1.w,
                              ),
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: Container(
                                    width: 95.w,
                                    child: Text(controller
                                        .placesList[index].placename)),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoadingRegistering.value == false
                ? InkWell(
                    onTap: () async {
                      controller.isLoadingRegistering.value = true;
                      await controller.createProfile();
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
                          color: Color.fromARGB(255, 182, 221, 184),
                          borderRadius: BorderRadius.circular(25),
                        ),
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
                        color: Color.fromARGB(255, 182, 221, 184),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
