import 'package:ams/pages/profilescreen/view/profile_google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/profilescreen_controller.dart';

class ProfileView extends GetView<ProfileViewController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileViewController());
    return Scaffold(
        body: Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value == true
              ? Container(
                  height: 100.h,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Obx(
                      () => controller.userimage.value == ""
                          ? Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 211, 209, 209),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            )
                          : Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 211, 209, 209),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          controller.userimage.value))),
                            ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     controller.openCamera();
                    //   },
                    //   child: Obx(
                    //     () => controller.userimage.value == ""
                    //         ? CircleAvatar(
                    //             radius: 30.w,
                    //             backgroundColor: Colors.grey,
                    //           )
                    //         : CircleAvatar(
                    //             radius: 30.w,
                    //             backgroundColor: Colors.grey,
                    //             child: Obx(
                    //               () => controller.isGettingAndUploadingIamge
                    //                           .value ==
                    //                       true
                    //                   ? Center(
                    //                       child: CircularProgressIndicator(
                    //                         color: Colors.white,
                    //                       ),
                    //                     )
                    //                   : CircleAvatar(
                    //                       radius: 29.w,
                    //                       backgroundColor: Colors.white,
                    //                       backgroundImage: NetworkImage(
                    //                           controller.userimage.value),
                    //                     ),
                    //             ),
                    //           ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                                width: 42.w,
                                child: Text(
                                  "First name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      letterSpacing: 1),
                                )),
                            SizedBox(
                              height: .5.h,
                            ),
                            Container(
                              height: 8.h,
                              width: 42.w,
                              child: TextField(
                                controller: controller.textFirstName,
                                obscureText: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 11.sp),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 182, 238, 184),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                width: 42.w,
                                child: Text(
                                  "Last name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      letterSpacing: 1),
                                )),
                            SizedBox(
                              height: .5.h,
                            ),
                            Container(
                              height: 8.h,
                              width: 42.w,
                              child: TextField(
                                controller: controller.textLastname,
                                obscureText: false,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 11.sp),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 100.w,
                        child: Text(
                          "Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              letterSpacing: 1),
                        )),
                    SizedBox(
                      height: .5.h,
                    ),
                    Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: controller.textaddressname,
                        obscureText: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 11.sp),
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                Get.to(() => ProfileGoogleMapView());
                              },
                              child: Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 182, 238, 184),
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 100.w,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              letterSpacing: 1),
                        )),
                    SizedBox(
                      height: .5.h,
                    ),
                    Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: controller.textemail,
                        obscureText: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 11.sp),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Color.fromARGB(255, 182, 238, 184),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                        width: 100.w,
                        child: Text(
                          "Contact no.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              letterSpacing: 1),
                        )),
                    SizedBox(
                      height: .5.h,
                    ),
                    Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: controller.textcontact,
                        obscureText: false,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 11.sp),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (controller.textcontact.text.length == 0) {
                          } else {
                            if (controller.textcontact.text[0] != "9" ||
                                controller.textcontact.text.length > 10) {
                              controller.textcontact.clear();
                            } else {}
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 182, 238, 184),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     ProfileDialogs.showDatePicker(controller: controller);
                    //     // FocusScope.of(context).unfocus();
                    //   },
                    //   child: Container(
                    //       padding: EdgeInsets.only(left: 3.w),
                    //       height: 8.h,
                    //       width: 100.w,
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.grey),
                    //           borderRadius: BorderRadius.circular(6)),
                    //       alignment: Alignment.centerLeft,
                    //       child: Obx(
                    //         () => Text(
                    //           controller.birthday.value,
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               letterSpacing: 1.5,
                    //               fontSize: 11.sp),
                    //         ),
                    //       )),
                    // ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(
                      () => controller.isUpdating.value == false
                          ? InkWell(
                              onTap: () {
                                if (controller.textFirstName.text.isEmpty ||
                                    controller.textLastname.text.isEmpty ||
                                    controller.textaddressname.text.isEmpty ||
                                    controller.textemail.text.isEmpty ||
                                    controller.textcontact.text.isEmpty) {
                                  // controller.login();
                                  Get.snackbar(
                                    "Message",
                                    "Oops, Missing Input",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else if (controller.textemail.text.isEmail ==
                                    false) {
                                  Get.snackbar(
                                    "Message",
                                    "Oops, Invalid Email",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else if (controller.textcontact.text.length !=
                                    10) {
                                  Get.snackbar(
                                    "Message",
                                    "Oops, Invalid Contact no.",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else {
                                  controller.updateProfile();
                                }
                              },
                              child: Container(
                                height: 8.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 182, 221, 184),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(spreadRadius: .05, blurRadius: 5)
                                  ],
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "UPDATE",
                                  style: TextStyle(
                                    letterSpacing: 4,
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 8.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 182, 221, 184),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(spreadRadius: .05, blurRadius: 5)
                                ],
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                  ],
                ),
        ),
      ),
    ));
  }
}
