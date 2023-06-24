import 'dart:io';

import 'package:ams/pages/createprofilescreen/controller/createprofile_controller.dart';
import 'package:ams/pages/createprofilescreen/view/createprofile_google_maps.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreateProfileUploadImage extends GetView<CreateProfileViewController> {
  const CreateProfileUploadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Profile Picture",
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => controller.imagepath.value.trim().toString() == ""
                ? Container(
                    height: 70.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_a_photo,
                      size: 25.sp,
                    ),
                  )
                : Container(
                    height: 70.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(controller.imagepath.value))),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                  )),
            Container(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.openCamera();
                    },
                    child: Container(
                      height: 7.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Camera",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: () {
                      controller.openGallery();
                    },
                    child: Container(
                      height: 7.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Obx(
              () => controller.imagepath.value.trim().toString() != ""
                  ? InkWell(
                      onTap: () {
                        controller.isLoadingRegistering.value = false;
                        Get.to(() => CreateProfileGoogleMaps());
                        Get.snackbar(
                            "Message", "Please tap on your exact location",
                            colorText: Colors.white,
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.TOP,
                            duration: Duration(seconds: 8));
                      },
                      child: Container(
                        height: 7.h,
                        width: 92.w,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 182, 221, 184),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
