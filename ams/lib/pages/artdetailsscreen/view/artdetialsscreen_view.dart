import 'package:ams/pages/artdetailsscreen/view/stripe_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/artdetailsscreen_controller.dart';

class ArtDetailsScreenView extends GetView<ArtDetailsScreenController> {
  const ArtDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArtDetailsScreenController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
                      child: Container(
                        height: 55.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                controller.artDetails.images[0].url),
                          ),
                        ),

                        // child: controller.artDetails.images.length != 0
                        //     ? Image(
                        //         fit: BoxFit.cover,
                        //         image: NetworkImage(
                        //             controller.artDetails.images[0].url))
                        //     : Image(
                        //         fit: BoxFit.cover,
                        //         image: AssetImage(
                        //             "assets/images/amslogotoobig.png"),
                        //       ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              width: 100.w,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.artDetails.title
                                    .toString()
                                    .capitalizeFirst
                                    .toString(),
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    letterSpacing: 1),
                              )),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "P" +
                                    controller.artDetails.price
                                        .toString()
                                        .capitalizeFirst
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.sp,
                                    color: Colors.redAccent,
                                    letterSpacing: 1),
                              )),
                          Container(
                              width: 100.w,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.artDetails.address.name
                                    .toString()
                                    .capitalizeFirst
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp,
                                    letterSpacing: 1),
                              )),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.artDetails.distanceBetween
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp,
                                    letterSpacing: 1),
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              width: 100.w,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                controller.artDetails.description
                                    .toString()
                                    .capitalizeFirst
                                    .toString(),
                                maxLines: 8,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp,
                                    letterSpacing: 1),
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            // controller.artDetails.isSelected.value = true;
                            await controller.setToTrue();
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 3.w,
                            ),
                            child: Container(
                                height: 5.h,
                                width: 30.w,
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
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 25.sp,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.setToTrue();
                            Get.to(() => StripePaymentS(), arguments: {
                              // "amount": controller.artDetails.price.toString(),
                              // "artistID":
                              //     controller.artDetails.accountId.toString(),
                              // "artID": controller.artDetails.id.toString()
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 3.w,
                            ),
                            child: Container(
                              height: 5.h,
                              width: 60.w,
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
                                "BUY NOW",
                                style: TextStyle(
                                  letterSpacing: 4,
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
