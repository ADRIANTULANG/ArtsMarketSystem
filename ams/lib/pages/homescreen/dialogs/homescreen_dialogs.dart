import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../services/storage_services.dart';
import '../../loginscreen/view/loginview_view.dart';

class HomeScreenDialog {
  static showLogoutDialog({required HomeScreenController controller}) {
    Get.dialog(
      AlertDialog(
        content: Container(
          width: 100.w,
          height: 13.h,
          child: Column(
            children: [
              Text(
                "Exit app ?",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                            fontSize: 12.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.find<StorageServices>().removeStorageCredentials();
                        Get.offAll(() => LoginView());
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
