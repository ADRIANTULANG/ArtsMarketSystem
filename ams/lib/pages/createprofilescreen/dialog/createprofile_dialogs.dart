import 'package:ams/pages/createprofilescreen/controller/createprofile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateProfileDialogs {
  static showDatePicker({required CreateProfileViewController controller}) {
    Get.dialog(
      AlertDialog(
        content: Container(
          height: 50.h,
          width: 100.w,
          child: SfDateRangePicker(
            onSelectionChanged: controller.onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.single,
          ),
        ),
      ),
    );
  }
}
