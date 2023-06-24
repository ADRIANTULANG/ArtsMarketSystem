import 'package:ams/pages/artofartistscreen/view/art_of_artist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../services/location_services.dart';
import '../controller/homescreen_controller.dart';

class HomeScreenGoogleMapView extends GetView<HomeScreenController> {
  const HomeScreenGoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Obx(
          () => GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(Get.find<LocationServices>().user_latitude,
                  Get.find<LocationServices>().user_longitude),
              zoom: 10.4746,
            ),
            // onTap: (LatLng location) {
            //   // controller.ontap_GoogleMap(
            //   //     latitude: location.latitude, longitude: location.longitude);
            // },
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 8.h,
                width: 75.w,
                child: TextField(
                  controller: controller.searchartist,
                  obscureText: false,
                  onChanged: (value) {
                    controller.markers.clear();
                    controller.searchArtist(word: controller.searchartist.text);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.searchartist.clear();
                          controller.artistList
                              .assignAll(controller.artistList_MasterList);
                        },
                        child: Icon(Icons.clear)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Search',
                  ),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        if (controller.isSwitched.value == true) {
                          controller.isSwitched.value = false;
                        } else {
                          controller.isSwitched.value = true;
                        }
                      },
                      icon: Icon(Icons.home_rounded)))
            ],
          ),
        ),
        Positioned(
            child: Container(
          height: 23.h,
          width: 100.w,
          padding: EdgeInsets.only(bottom: 2.h),
          alignment: Alignment.center,
          child: Obx(
            () => ListView.builder(
              itemCount: controller.artistList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: 1.w, right: 1.w),
                  child: InkWell(
                    onTap: () {
                      controller.getCenter(
                          currentLatlng: LatLng(
                              Get.find<LocationServices>().user_latitude,
                              Get.find<LocationServices>().user_longitude),
                          artLatLng: LatLng(
                              double.parse(controller.artistList[index].address!
                                  .coordinates!.latitude!),
                              double.parse(controller.artistList[index].address!
                                  .coordinates!.longitude!)),
                          artname: controller.artistList[index].name!.first!
                                  .toString() +
                              " " +
                              controller.artistList[index].name!.last!
                                  .toString());
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 2.w,
                      ),
                      height: 20.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                            height: 19.h,
                            width: 40.w,
                            child: controller.artistList[index].avatar != ""
                                ? Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        controller.artistList[index].avatar!))
                                : Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/amslogotoobig.png")),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                              child: Container(
                            height: 19.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    controller.artistList[index].name!.first!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1),
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 100.w,
                                  child: Text(
                                    controller.artistList[index].address!.name!
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        letterSpacing: 1),
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  child: Text(
                                    controller.artistList[index].contact!.email
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        letterSpacing: 1),
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  child: Text(
                                    controller.artistList[index].contact!.number
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                        letterSpacing: 1),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => ArtistArtView(), arguments: {
                                        "artist_id": controller
                                            .artistList[index].accountId
                                            .toString(),
                                        "artist_name": controller
                                                .artistList[index].name!.first!
                                                .toString()
                                                .capitalizeFirst
                                                .toString() +
                                            " " +
                                            controller
                                                .artistList[index].name!.last!
                                                .toString()
                                                .capitalizeFirst
                                                .toString(),
                                        "artist_email": controller
                                            .artistList[index].contact!.email!
                                            .toString(),
                                        "artist_image": controller
                                            .artistList[index].avatar!
                                            .toString(),
                                        "artist_Number": controller
                                            .artistList[index].contact!.number!
                                            .toString(),
                                        "artist_Address": controller
                                            .artistList[index].address!.name
                                            .toString(),
                                      });
                                    },
                                    child: Container(
                                      height: 4.h,
                                      width: 25.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 160, 182, 135),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "VIEW",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.sp,
                                            letterSpacing: 2),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )),
      ]),
    );
  }
}
