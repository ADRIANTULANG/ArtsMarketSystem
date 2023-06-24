// import 'package:ams/pages/registrationscreen/dialogs/registration_dialogs.dart';
// import 'package:ams/pages/registrationscreen/view/registration_upload_image.dart';
// import 'package:ams/pages/registrationscreen/view/registration_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Container(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              // Container(
              //   height: 8.h,
              //   width: 100.w,
              //   child: TextField(
              //     controller: controller.firstname,
              //     obscureText: false,
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         letterSpacing: 1.5,
              //         fontSize: 11.sp),
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(6)),
              //       labelText: 'First name',
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 8.h,
              //   width: 100.w,
              //   child: TextField(
              //     controller: controller.lastname,
              //     obscureText: false,
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         letterSpacing: 1.5,
              //         fontSize: 11.sp),
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(6)),
              //       labelText: 'Last name',
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 8.h,
              //   width: 100.w,
              //   child: TextField(
              //     controller: controller.email,
              //     obscureText: false,
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         letterSpacing: 1.5,
              //         fontSize: 11.sp),
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(6)),
              //       labelText: 'Email',
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   height: 8.h,
              //   width: 100.w,
              //   child: TextField(
              //     controller: controller.address,
              //     obscureText: false,
              //     style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         letterSpacing: 1.5,
              //         fontSize: 11.sp),
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(6)),
              //       labelText: 'Address',
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // InkWell(
              //   onTap: () {
              //     RegistrationDialogs.showDatePicker(controller: controller);
              //     FocusScope.of(context).unfocus();
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
              //           controller.selectedDate.value,
              //           style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               letterSpacing: 1.5,
              //               fontSize: 11.sp),
              //         ),
              //       )),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              Container(
                height: 8.h,
                width: 100.w,
                child: TextField(
                  controller: controller.username,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Username',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)
                      // hintText: 'Enter username',
                      ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 8.h,
                width: 100.w,
                child: TextField(
                  controller: controller.password,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Password',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)
                      // hintText: 'Enter username',
                      ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 8.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.contactnumber,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contactnumber.text.length == 0) {
                    } else {
                      if (controller.contactnumber.text[0] != "9" ||
                          controller.contactnumber.text.length > 10) {
                        controller.contactnumber.clear();
                      } else {}
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Contact No.',
                      // hintText: 'Enter Contact No.',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => controller.isRegistering.value == false
                    ? InkWell(
                        onTap: () async {
                          if (
                              // controller.firstname.text.isEmpty ||
                              //   controller.lastname.text.isEmpty ||
                              //   controller.email.text.isEmpty ||
                              //   controller.contactnumber.text.isEmpty ||
                              // controller.selectedDate == "Birthday" ||

                              controller.username.text.isEmpty ||
                                  controller.password.text.isEmpty) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Missing inputs",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.contactnumber.text.length !=
                              10) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Invalid contact number",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.password.text.length < 10) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Password must have at least 10 characters and maximum of 25",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.pass_valid
                                  .hasMatch(controller.password.text) ==
                              false) {
                            // Get.to(() => CreateProfileUploadImage());
                            Get.snackbar(
                              "Message",
                              "Oops.. Password should be 10 characters, contains Capital letter, Small letter, Number, Special characters",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.username.text.isEmail ==
                              false) {
                            // Get.to(() => CreateProfileUploadImage());
                            Get.snackbar(
                              "Message",
                              "Oops.. Invalid Username. Ex: sample@gmail.com",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            controller.verifiyNumber();
                            // await controller.register();
                            // Get.to(() => RegistrationUploadImage());
                          }
                          // if (controller.contactnumber.text.length != 10) {
                          //   Get.snackbar(
                          //     "Message",
                          //     "Oops, Invalid Contact number",
                          //     colorText: Colors.white,
                          //     backgroundColor: Colors.green,
                          //     snackPosition: SnackPosition.TOP,
                          //   );
                          // } else if (controller.username.text.isEmpty &&
                          //     controller.password.text.isEmpty &&
                          //     controller.contactnumber.text.isEmpty) {
                          //   Get.snackbar(
                          //     "Message",
                          //     "Oops, Missing Input",
                          //     colorText: Colors.white,
                          //     backgroundColor: Colors.green,
                          //     snackPosition: SnackPosition.TOP,
                          //   );
                          // } else {
                          //   controller.verifiyNumber();
                          // }
                        },
                        child: Container(
                          height: 8.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 182, 221, 184),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.black54)),
                          alignment: Alignment.center,
                          child: Text(
                            "CREATE",
                            style: TextStyle(
                              letterSpacing: 4,
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
                            border: Border.all(color: Colors.black54)),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
