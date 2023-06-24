import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TermsAndConditionsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  TextStyle header = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    letterSpacing: 1,
  );

  TextStyle body = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    letterSpacing: 1,
  );

  TextStyle microbody = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9.sp,
    letterSpacing: 1,
  );
}
