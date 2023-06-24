import 'package:ams/pages/homescreen/dialogs/homescreen_dialogs.dart';
import 'package:ams/pages/profilescreen/view/profilescreen_view.dart';
import 'package:ams/pages/purchasehistoryscreen/view/purchasehistory_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/homescreen_controller.dart';
import 'googlemap_homescreen_view.dart';
import 'listview_homescreen_view.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return WillPopScope(
      onWillPop: (() =>
          HomeScreenDialog.showLogoutDialog(controller: controller)),
      child: Obx(() => controller.isLoading.value == true
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                        child: Center(
                      child: Row(
                        children: [
                          Obx(
                            () => controller.userimage.value == ""
                                ? CircleAvatar(
                                    radius: 16.w,
                                    backgroundColor: Colors.grey,
                                  )
                                : CircleAvatar(
                                    radius: 16.w,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      radius: 15.w,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          controller.userimage.value),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.firstname.value +
                                        " " +
                                        controller.lastname.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text(
                                    controller.email.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Text(
                                    controller.contact.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      controller.addressname.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    controller.birthday.value,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                    ListTile(
                      onTap: () {
                        // controller.getArtStore();
                        Get.to(() => ProfileView());
                      },
                      leading: Icon(Icons.person),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        // controller.getArtStore();
                        Get.to(() => PurchaseHistoryView());
                      },
                      leading: Icon(Icons.list),
                      title: Text(
                        "Purchases",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.back();
                        HomeScreenDialog.showLogoutDialog(
                            controller: controller);
                      },
                      leading: Icon(Icons.logout),
                      title: Text(
                        "logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // appBar: AppBar(
              //   backgroundColor: Colors.lightGreen,
              //   title: Text("Arts Market"),
              //   actions: [
              //     IconButton(
              //         onPressed: () {
              //           if (controller.isSwitched.value == true) {
              //             controller.isSwitched.value = false;
              //           } else {
              //             controller.isSwitched.value = true;
              //           }
              //         },
              //         icon: Obx(() => controller.isSwitched.value == false
              //             ? Icon(Icons.location_on)
              //             : Icon(Icons.list))),
              //     SizedBox(
              //       width: 2.w,
              //     )
              //   ],
              // ),
              body: Obx(
                () => controller.isSwitched.value == false
                    ? ListViewHomeScreenView()
                    : HomeScreenGoogleMapView(),
              ),
            )),
    );
  }
}
