import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../artdetailsscreen/view/artdetialsscreen_view.dart';
import '../controller/art_of_artist_controller.dart';

class ArtistArtView extends GetView<ArtOfArtist> {
  const ArtistArtView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArtOfArtist());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9.h,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => controller.artist_image.value == ""
                              ? CircleAvatar(
                                  radius: 16.w,
                                  backgroundColor: Colors.grey,
                                  child: CircleAvatar(
                                    radius: 15.w,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                        "assets/images/amslogotoobig.png"),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 16.w,
                                  backgroundColor: Colors.grey,
                                  child: CircleAvatar(
                                    radius: 15.w,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        controller.artist_image.value),
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 100.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.artist_name.value,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 100.w,
                                  child: Obx(
                                    () => Text(
                                      controller.artist_Address.value,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 9.sp),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.artist_email.value,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 9.sp),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.artist_Number.value,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 9.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Divider(
                      color: Color.fromARGB(255, 209, 209, 209),
                    ),

                    Expanded(
                      child: Container(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: controller.artist_arts_list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: InkWell(
                                  onTap: () {
                                    if (controller.artist_arts_list[index]
                                            .availability ==
                                        true) {
                                      Get.to(() => ArtDetailsScreenView(),
                                          arguments: {
                                            "artId": controller
                                                .artist_arts_list[index].id,
                                            "artDetails": controller
                                                .artist_arts_list[index],
                                          });
                                    }
                                  },
                                  onLongPress: () {
                                    controller.setToFalse(
                                        artid: controller
                                            .artist_arts_list[index].id);
                                  },
                                  child: Obx(
                                    () => Container(
                                      color: controller.artist_arts_list[index]
                                                  .isSelected.value ==
                                              true
                                          ? Color.fromARGB(255, 216, 247, 217)
                                          : Colors.white,
                                      padding: EdgeInsets.only(
                                          bottom: 1.h, top: 1.h, right: 1.w),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              Container(
                                                height: 15.h,
                                                width: 40.w,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        opacity: controller
                                                                    .artist_arts_list[
                                                                        index]
                                                                    .availability ==
                                                                false
                                                            ? .5
                                                            : 1,
                                                        image: NetworkImage(
                                                            controller
                                                                .artist_arts_list[
                                                                    index]
                                                                .images[0]
                                                                .url))),
                                              ),
                                              controller.artist_arts_list[index]
                                                          .availability ==
                                                      false
                                                  ? Positioned(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: 15.h,
                                                          width: 40.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight: Radius
                                                                  .circular(25),
                                                            ),
                                                            image:
                                                                DecorationImage(
                                                              // opacity: .5,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              image: AssetImage(
                                                                  "assets/images/sold.png"),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox()
                                            ],
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 15.h,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 100.w,
                                                      child: Text(
                                                        controller
                                                            .artist_arts_list[
                                                                index]
                                                            .title,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 1.5,
                                                            fontSize: 12.sp),
                                                      )),
                                                  Container(
                                                      width: 100.w,
                                                      child: Text(
                                                        "P " +
                                                            controller
                                                                .artist_arts_list[
                                                                    index]
                                                                .price
                                                                .toString(),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 1.5,
                                                            color: Colors.red,
                                                            fontSize: 9.sp),
                                                      )),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Container(
                                                      width: 100.w,
                                                      child: Text(
                                                        controller
                                                            .artist_arts_list[
                                                                index]
                                                            .address
                                                            .name,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 1.5,
                                                            fontSize: 9.sp),
                                                      )),
                                                  Container(
                                                      width: 100.w,
                                                      child: Text(
                                                        controller
                                                            .artist_arts_list[
                                                                index]
                                                            .distanceBetween!,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 1.5,
                                                            fontSize: 9.sp),
                                                      )),
                                                  SizedBox(
                                                    height: .5.h,
                                                  ),
                                                  Container(
                                                      width: 100.w,
                                                      child: Text(
                                                        controller
                                                            .artist_arts_list[
                                                                index]
                                                            .description,
                                                        maxLines: 4,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            letterSpacing: 1.5,
                                                            color: Colors
                                                                .grey[500],
                                                            fontSize: 8.sp),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // InkWell(
                    //   onTap: () async {},
                    //   child: Container(
                    //     height: 8.h,
                    //     width: 100.w,
                    //     decoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 182, 221, 184),
                    //       borderRadius: BorderRadius.circular(25),
                    //       boxShadow: [BoxShadow(spreadRadius: .05, blurRadius: 5)],
                    //       border: Border.all(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "VIEW",
                    //       style: TextStyle(
                    //           letterSpacing: 3,
                    //           fontSize: 20.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 2.h,
                    // )
                  ],
                ),
        ),
      ),
    );
  }
}
