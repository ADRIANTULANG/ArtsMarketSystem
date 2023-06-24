import 'package:ams/pages/registrationscreen/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RegistrationDialogs {
  static showDatePicker({required RegistrationController controller}) {
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
