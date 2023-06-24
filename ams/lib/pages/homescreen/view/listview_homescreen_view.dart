import 'package:ams/pages/artdetailsscreen/view/artdetialsscreen_view.dart';
import 'package:badges/badges.dart' as badge;
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../artdetailsscreen/view/stripe_payment.dart';
import '../controller/homescreen_controller.dart';

class ListViewHomeScreenView extends GetView<HomeScreenController> {
  const ListViewHomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 7.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.sp,
                      letterSpacing: 1),
                ),
                Row(
                  children: [
                    Obx(
                      () => controller.getLengthOfCart().value == "0"
                          ? CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 212, 230, 191),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_bag,
                                    color: Colors.black,
                                  )))
                          : badge.Badge(
                              borderSide: BorderSide(color: Colors.black),
                              badgeColor: Colors.white,
                              badgeContent: Text(
                                controller.getLengthOfCart().value,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              position: badge.BadgePosition(
                                  bottom: 2.8.h, start: 7.w),
                              child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 212, 230, 191),
                                  child: IconButton(
                                      onPressed: () {
                                        Get.to(() => StripePaymentS(),
                                            arguments: {});
                                      },
                                      icon: Icon(
                                        Icons.shopping_bag,
                                        color: Colors.black,
                                      ))),
                            ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 212, 230, 191),
                      child: IconButton(
                          onPressed: () {
                            if (controller.isSwitched.value == true) {
                              controller.isSwitched.value = false;
                            } else {
                              controller.isSwitched.value = true;
                            }
                          },
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 212, 230, 191),
                        child: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              Icons.account_box,
                              color: Colors.black,
                            ))),
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              width: 100.w,
              child: Text(
                controller.firstname.value + " " + controller.lastname.value,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15.sp,
                    color: Color.fromARGB(255, 160, 182, 135),
                    letterSpacing: 1),
              )),
          SizedBox(
            height: 2.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            height: 8.h,
            width: 100.w,
            child: TextField(
              controller: controller.search,
              obscureText: false,
              onChanged: (value) {
                controller.searchArt(word: controller.search.text);
              },
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.search.clear();
                      controller.artStores
                          .assignAll(controller.artStores_masterList);
                    },
                    child: Icon(Icons.clear)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                labelText: 'Search',
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: Obx(
              () => CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {},
                    enlargeCenterPage: true,
                    height: 70.h,
                    viewportFraction: 0.78),
                items: controller.artStores.map((artstore) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: InkWell(
                          onTap: () {
                            if (artstore.availability == true) {
                              Get.to(() => ArtDetailsScreenView(), arguments: {
                                "artId": artstore.id,
                                "artDetails": artstore,
                              });
                            }
                          },
                          child: Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 227, 238, 215),
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                          image: DecorationImage(
                                            opacity:
                                                artstore.availability == false
                                                    ? .5
                                                    : 1,
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                artstore.images[0].url),
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => artstore.isSelected.value == true
                                            ? Positioned(
                                                left: 4.w,
                                                top: 1.5.h,
                                                child: InkWell(
                                                  onTap: () {
                                                    artstore.isSelected.value =
                                                        false;
                                                  },
                                                  child: Icon(
                                                    Icons.shopping_cart,
                                                    color: Color.fromARGB(
                                                        255, 98, 241, 103),
                                                  ),
                                                ))
                                            : SizedBox(),
                                      ),
                                      artstore.availability == false
                                          ? Positioned(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 40.h,
                                                  width: 60.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      topRight:
                                                          Radius.circular(25),
                                                    ),
                                                    image: DecorationImage(
                                                      // opacity: .5,
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage(
                                                          "assets/images/sold.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      // Positioned(
                                      //   right: 13.w,
                                      //   top: 1.5.h,
                                      //   child: InkWell(
                                      //     onTap: () {
                                      //       if (artstore.isLike.value ==
                                      //           false) {
                                      //         artstore.isLike.value = true;
                                      //       } else {
                                      //         artstore.isLike.value = false;
                                      //       }
                                      //     },
                                      //     child: Obx(
                                      //       () => artstore.isLike.value == false
                                      //           ? Icon(
                                      //               Icons.favorite,
                                      //               color: Colors.white,
                                      //             )
                                      //           : Icon(
                                      //               Icons.favorite,
                                      //               color: Colors.pink,
                                      //             ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // Positioned(
                                      //   right: 3.w,
                                      //   top: 1.5.h,
                                      //   child: Icon(
                                      //     Icons.comment,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                      width: 100.w,
                                      padding: EdgeInsets.only(left: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        artstore.title
                                            .toString()
                                            .capitalizeFirst
                                            .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                            letterSpacing: 1),
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(left: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "P " + artstore.price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.sp,
                                            color: Colors.red,
                                            letterSpacing: 1),
                                      )),
                                  Container(
                                      width: 100.w,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        artstore.address.name.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.sp,
                                            letterSpacing: 1),
                                      )),
                                  Container(
                                      width: 100.w,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        artstore.distanceBetween.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.sp,
                                            letterSpacing: 1),
                                      )),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // artStores[index].tags.length
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        artstore.description.toString(),
                                        maxLines: 3,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.sp,
                                            letterSpacing: 1),
                                      )),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // "#asdad#asdasd#asdasd#asdasd#asdasd#asdasd",
                                        controller
                                            .addTags(list: artstore.tags)
                                            .toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.sp,
                                            color: Colors.lightBlue,
                                            letterSpacing: 1),
                                      )),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          )
          // Expanded(
          //     child: Container(
          //   child: Obx(
          //     () => ListView.builder(
          //       padding: EdgeInsets.all(0),
          //       itemCount: controller.artStores.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Padding(
          //           padding:
          //               EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.5.h),
          //           child: InkWell(
          //             onTap: () {
          //               Get.to(() => ArtDetailsScreenView(), arguments: {
          //                 "artId": controller.artStores[index].id,
          //                 "artDetails": controller.artStores[index],
          //               });
          //             },
          //             child: Container(
          //               padding: EdgeInsets.only(bottom: 1.5.h, top: 1.5.h),
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     height: 24.h,
          //                     width: 100.w,
          //                     child: controller
          //                                 .artStores[index].images.length !=
          //                             0
          //                         ? Image(
          //                             fit: BoxFit.cover,
          //                             image: NetworkImage(controller
          //                                 .artStores[index].images[0].url))
          //                         : Image(
          //                             fit: BoxFit.cover,
          //                             image: AssetImage(
          //                                 "assets/images/amslogotoobig.png")),
          //                   ),
          //                   Container(
          //                     width: 100.w,
          //                     padding: EdgeInsets.only(left: .5.w),
          //                     child: Column(
          //                       children: [
          //                         SizedBox(
          //                           height: 1.h,
          //                         ),
          //                         Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           children: [
          //                             Row(
          //                               children: [
          //                                 Container(
          //                                     alignment: Alignment.centerLeft,
          //                                     child: Text(
          //                                       "Title: ",
          //                                       style: TextStyle(
          //                                           fontWeight: FontWeight.w400,
          //                                           fontSize: 16.sp,
          //                                           letterSpacing: 1),
          //                                     )),
          //                                 Container(
          //                                     alignment: Alignment.centerLeft,
          //                                     child: Text(
          //                                       controller
          //                                           .artStores[index].title
          //                                           .toString()
          //                                           .capitalizeFirst
          //                                           .toString(),
          //                                       style: TextStyle(
          //                                           fontWeight: FontWeight.bold,
          //                                           fontSize: 16.sp,
          //                                           letterSpacing: 1),
          //                                     )),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         Container(
          //                             alignment: Alignment.centerLeft,
          //                             child: Text(
          //                               "P" +
          //                                   controller.artStores[index].price
          //                                       .toString()
          //                                       .capitalizeFirst
          //                                       .toString(),
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: 16.sp,
          //                                   color: Colors.redAccent,
          //                                   letterSpacing: 1),
          //                             )),
          //                         Row(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   "Description: ",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w300,
          //                                       fontSize: 10.sp,
          //                                       letterSpacing: 1),
          //                                 )),
          //                             Expanded(
          //                               child: Container(
          //                                   alignment: Alignment.centerLeft,
          //                                   child: Text(
          //                                     controller
          //                                         .artStores[index].description
          //                                         .toString()
          //                                         .capitalizeFirst
          //                                         .toString(),
          //                                     style: TextStyle(
          //                                         fontWeight: FontWeight.w300,
          //                                         fontSize: 10.sp,
          //                                         letterSpacing: 1),
          //                                   )),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   "Address: ",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w300,
          //                                       fontSize: 10.sp,
          //                                       letterSpacing: 1),
          //                                 )),
          //                             Expanded(
          //                               child: Container(
          //                                   alignment: Alignment.centerLeft,
          //                                   child: Text(
          //                                     controller
          //                                         .artStores[index].address.name
          //                                         .toString()
          //                                         .capitalizeFirst
          //                                         .toString(),
          //                                     style: TextStyle(
          //                                         fontWeight: FontWeight.w300,
          //                                         fontSize: 10.sp,
          //                                         letterSpacing: 1),
          //                                   )),
          //                             ),
          //                           ],
          //                         ),
          //                         Row(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   "Distance: ",
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w300,
          //                                       fontSize: 10.sp,
          //                                       letterSpacing: 1),
          //                                 )),
          //                             Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   controller.artStores[index]
          //                                       .distanceBetween
          //                                       .toString(),
          //                                   style: TextStyle(
          //                                       fontWeight: FontWeight.w300,
          //                                       fontSize: 10.sp,
          //                                       letterSpacing: 1),
          //                                 )),
          //                           ],
          //                         ),
          //                         SizedBox(
          //                           height: 1.h,
          //                         ),
          //                         Container(
          //                           child: ListView.builder(
          //                             shrinkWrap: true,
          //                             physics: NeverScrollableScrollPhysics(),
          //                             itemCount: controller
          //                                 .artStores[index].tags.length,
          //                             itemBuilder: (BuildContext context,
          //                                 int tagsIndex) {
          //                               return Text(
          //                                 controller
          //                                     .artStores[index].tags[tagsIndex],
          //                                 style: TextStyle(
          //                                     fontWeight: FontWeight.w300,
          //                                     fontSize: 10.sp,
          //                                     color: Colors.lightBlue[200],
          //                                     letterSpacing: 1),
          //                               );
          //                             },
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ))
        ],
      ),
    );
  }
}
