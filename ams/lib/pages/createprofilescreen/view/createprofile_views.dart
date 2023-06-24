import 'package:ams/pages/createprofilescreen/dialog/createprofile_dialogs.dart';
import 'package:ams/pages/createprofilescreen/view/createprofile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/createprofile_controller.dart';

class CreateProfileView extends GetView<CreateProfileViewController> {
  const CreateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateProfileViewController());
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
              Text(
                "Create Profile",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 8.h,
                width: 100.w,
                child: TextField(
                  controller: controller.firstname,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 203, 248, 205),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    labelText: 'First name',
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
                  controller: controller.lastname,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 203, 248, 205),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    labelText: 'Last name',
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
                  controller: controller.email,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 203, 248, 205),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    labelText: 'Email',
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
                  controller: controller.contact,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contact.text.length == 0) {
                    } else {
                      if (controller.contact.text[0] != "9" ||
                          controller.contact.text.length > 10) {
                        controller.contact.clear();
                      } else {}
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.call,
                      color: Color.fromARGB(255, 203, 248, 205),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    labelText: 'Contact number',
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
                  controller: controller.address,
                  obscureText: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      fontSize: 11.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 203, 248, 205),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    labelText: 'Address',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  CreateProfileDialogs.showDatePicker(controller: controller);
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 3.w),
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Color.fromARGB(255, 203, 248, 205),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Obx(
                        () => Text(
                          controller.selectedDate.value,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              color: Colors.grey[600],
                              fontSize: 11.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(
                () => controller.isRegistering.value == false
                    ? InkWell(
                        onTap: () {
                          if (controller.firstname.text.isEmpty ||
                              controller.lastname.text.isEmpty ||
                              controller.email.text.isEmpty ||
                              controller.contact.text.isEmpty ||
                              controller.address.text.isEmpty) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Missing inputs",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.contact.text.length != 10) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Invalid contact number",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else if (controller.email.text.isEmail == false) {
                            Get.snackbar(
                              "Message",
                              "Oops.. Invalid Email",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            Get.to(() => CreateProfileUploadImage());
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
                            "PROCEED",
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
            ],
          ),
        ),
      ),
    );
  }
}
