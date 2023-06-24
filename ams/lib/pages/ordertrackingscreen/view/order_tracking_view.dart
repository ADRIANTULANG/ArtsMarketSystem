import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../controller/order_tracking_controller.dart';

class OrderTrackingView extends GetView<OrdertrackingController> {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdertrackingController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 2.w, right: 4.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 6.w,
                  ),
                  width: 100.w,
                  child: Text(
                    "Track Order",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.w,
                      ),
                      child: Obx(
                        () => controller.image.value == ""
                            ? SizedBox()
                            : CircleAvatar(
                                radius: 10.5.w,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 10.w,
                                  backgroundColor: Colors.grey,
                                  child: CircleAvatar(
                                    radius: 15.w,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        NetworkImage(controller.image.value),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.artTitle.value,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              letterSpacing: 2),
                        ),
                        Text(
                          controller.artistname.value,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 9.sp,
                              letterSpacing: 2),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 6.w,
                  ),
                  width: 100.w,
                  child: Text(
                    controller.artDescription.value,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: IndicatorStyle(
                    indicator: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 1.5.h,
                      child: CircleAvatar(
                        radius: 1.h,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    width: 20,
                    color: Color.fromARGB(255, 142, 236, 189),
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Delivered!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/22/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Your package has been delivered. To file for Return/Refund please contact customer service to assist you.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                  beforeLineStyle: const LineStyle(
                    color: Colors.grey,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 22.h,
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Out for delivery!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/22/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Courier will attempt to deliver your parcel today! Please keep your lines open so our courier can contact yoi. If you are not available, please have an authorized representative to receive on your behalf",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Received in Local Hub!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/22/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Arrived in Cagayan De Oro City, Philippines Local Hub.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "In dispatch",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/21/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Departed from Laguna DC. Philippines.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 17.h,
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "In transit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/21/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Arrived at Laguna DC, Philippines. Preparing for disinfection and checking",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 15.h,
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Flight departure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/21/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Departed from International Warehouse.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  afterLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.black,
                  ),
                  isLast: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.black,
                    padding: EdgeInsets.all(6),
                  ),
                  endChild: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 17.h,
                          width: 75.w,
                          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: Color.fromARGB(255, 214, 213, 213))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: .5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "Shipped",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "9/19/2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text(
                                  "International Warehouse Package disinfection and processing completed, awaiting shipping",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                      letterSpacing: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          )),
    );
  }
}
