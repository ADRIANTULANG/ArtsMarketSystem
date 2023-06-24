import 'package:ams/pages/purchasehistoryscreen/controller/purchasehistory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../ordertrackingscreen/view/order_tracking_view.dart';

class PurchaseHistoryView extends GetView<PurchaseHistoryController> {
  const PurchaseHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PurchaseHistoryController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Purchase History",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: Container(
                        child: Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.historyList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding:
                                      EdgeInsets.only(left: 2.5.w, top: 2.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(controller.historyList[index].transactionId)

                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 8.5.w,
                                            backgroundColor: Colors.black,
                                            child: CircleAvatar(
                                              radius: 8.w,
                                              backgroundColor: Colors.grey,
                                              child: CircleAvatar(
                                                radius: 15.w,
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(
                                                    controller
                                                        .historyList[index]
                                                        .header
                                                        .artist
                                                        .avatar),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Text(
                                            controller.historyList[index].header
                                                    .artist.name.first +
                                                " " +
                                                controller.historyList[index]
                                                    .header.artist.name.last,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 2,
                                                fontSize: 12.sp),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        controller.historyList[index].art.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 2,
                                            fontSize: 12.sp),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      Text(
                                        controller
                                            .historyList[index].art.description,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 2,
                                            fontSize: 9.sp),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "P" +
                                            controller
                                                .historyList[index].art.price
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 2,
                                            color: Colors.red,
                                            fontSize: 12.sp),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.delivery_dining),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                "LBC",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 2,
                                                    color: Colors.black,
                                                    fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      () => OrderTrackingView(),
                                                      arguments: {
                                                        "artistname": controller
                                                                .historyList[
                                                                    index]
                                                                .header
                                                                .artist
                                                                .name
                                                                .first +
                                                            " " +
                                                            controller
                                                                .historyList[
                                                                    index]
                                                                .header
                                                                .artist
                                                                .name
                                                                .last,
                                                        "image": controller
                                                            .historyList[index]
                                                            .header
                                                            .artist
                                                            .avatar,
                                                        "artsPrice": controller
                                                            .historyList[index]
                                                            .art
                                                            .price
                                                            .toString(),
                                                        "artDescription":
                                                            controller
                                                                .historyList[
                                                                    index]
                                                                .art
                                                                .description,
                                                        "artTitle": controller
                                                            .historyList[index]
                                                            .art
                                                            .title,
                                                      });
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 179, 240, 181),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 4.w,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      // Container(
                                      //   height: 10.h,
                                      //   width: 100.w,
                                      //   child: Image(image: NetworkImage(controller.historyList[index])),
                                      // )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
