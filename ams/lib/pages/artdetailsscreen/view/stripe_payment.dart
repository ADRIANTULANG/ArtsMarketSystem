import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../services/storage_services.dart';
import '../../artofartistscreen/controller/art_of_artist_controller.dart';
import '../../homescreen/controller/homescreen_controller.dart';
import '../controller/artdetailsscreen_controller.dart';
import '../controller/stripecontroller.dart';

class StripePaymentS extends GetView<PaymentController> {
  const StripePaymentS({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return Scaffold(
      // body: Center(
      //   child: TextButton(
      //     child: Text("Pay"),
      //     onPressed: () async {
      //       // await controller.transactAmount(
      //       //     artID: controller.artID.value,
      //       //     artistID: controller.artistID.value,
      //       //     customerID:
      //       //         Get.find<StorageServices>().storage.read('accntId'));
      //     },
      //   ),
      // ),
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.5.h,
            ),
            Text(
              "Select Payment",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
            ),
            Text(
              "Option",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: controller.selectedArt.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: Container(
                        padding:
                            EdgeInsets.only(bottom: 1.h, top: 1.h, right: 1.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (controller
                                        .selectedArt[index].isSelected.value ==
                                    true) {
                                  controller.setToFalse(
                                      artid: controller.selectedArt[index].id);
                                  controller.selectedArt[index].isSelected
                                      .value = false;
                                  controller.calculateTotal();
                                } else {
                                  controller.setToTrue(
                                      artid: controller.selectedArt[index].id);
                                  controller.selectedArt[index].isSelected
                                      .value = true;
                                  controller.calculateTotal();
                                }
                              },
                              child: Obx(
                                () => Container(
                                    height: 4.h,
                                    alignment: Alignment.topCenter,
                                    child: controller.selectedArt[index]
                                                .isSelected.value ==
                                            true
                                        ? Icon(
                                            Icons.check_box,
                                            color: Color.fromARGB(
                                                255, 159, 243, 162),
                                          )
                                        : Icon(Icons
                                            .check_box_outline_blank_rounded)),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Container(
                              height: 15.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(controller
                                          .selectedArt[index].images[0].url))),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 15.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          controller.selectedArt[index].title,
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.5,
                                              fontSize: 12.sp),
                                        )),
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          "P " +
                                              controller
                                                  .selectedArt[index].price
                                                  .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.5,
                                              color: Colors.red,
                                              fontSize: 9.sp),
                                        )),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          controller
                                              .selectedArt[index].address.name,
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.5,
                                              fontSize: 9.sp),
                                        )),
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          controller.selectedArt[index]
                                              .distanceBetween!,
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.5,
                                              fontSize: 9.sp),
                                        )),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    Container(
                                        width: 100.w,
                                        child: Text(
                                          controller
                                              .selectedArt[index].description,
                                          maxLines: 4,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.5,
                                              color: Colors.grey[500],
                                              fontSize: 8.sp),
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                // Obx(
                //   () => Checkbox(
                //       value: controller.isStripeSelected.value,
                //       onChanged: (value) {
                //         if (controller.isStripeSelected.value == true) {
                //           controller.isStripeSelected.value = false;
                //           controller.isCODSelected.value = true;
                //         } else {
                //           controller.isStripeSelected.value = true;
                //           controller.isCODSelected.value = false;
                //         }
                //       }),
                // ),
                // Text(
                //   "STRIPE",
                //   style: TextStyle(
                //       fontSize: 12.sp,
                //       fontWeight: FontWeight.w400,
                //       letterSpacing: 2),
                // )
              ],
            ),
            Row(
              children: [
                // Obx(
                //   () => Checkbox(
                //       activeColor: Color.fromARGB(255, 159, 243, 162),
                //       value: controller.isCODSelected.value,
                //       onChanged: (value) {
                //         // if (controller.isCODSelected.value == true) {
                //         //   controller.isCODSelected.value = false;
                //         //   controller.isStripeSelected.value = true;
                //         // } else {
                //         //   controller.isCODSelected.value = true;
                //         //   controller.isStripeSelected.value = false;
                //         // }
                //       }),
                // ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  "COD",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "Total:",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ],
                ),
                Obx(() => Text(
                      "P " + controller.amount.value,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(
              () => controller.isLoadingPayment.value == false
                  ? InkWell(
                      onTap: () async {
                        if (controller.amount.value == "0.0") {
                          Get.snackbar('Message', 'Please select an item',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:
                                  Color.fromARGB(255, 160, 236, 163),
                              colorText: Colors.white,
                              margin: EdgeInsets.all(10),
                              duration: Duration(seconds: 2));
                        } else {
                          controller.isLoadingPayment(true);
                          // if (controller.isStripeSelected.value == true) {
                          //   await controller.makePayment(
                          //       amount: controller.amount.value,
                          //       currency: "PHP");
                          // } else {
                          for (var i = 0;
                              i < controller.selectedArt.length;
                              i++) {
                            if (controller.selectedArt[i].isSelected.value ==
                                true) {
                              await controller.transactAmountCOD(
                                  artID: controller.selectedArt[i].id,
                                  artistID: controller.selectedArt[i].accountId,
                                  customerID: Get.find<StorageServices>()
                                      .storage
                                      .read('accntId'));
                            }
                          }
                          if (Get.isRegistered<ArtDetailsScreenController>() ==
                              false) {
                            Get.back();
                          } else if (Get.isRegistered<ArtOfArtist>() == true) {
                            Get.back();
                            Get.back();
                            Get.back();
                          } else {
                            Get.back();
                            Get.back();
                          }
                          Get.snackbar('Message', 'Successfully placed order',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              margin: EdgeInsets.all(10),
                              duration: Duration(seconds: 2));
                          Get.find<HomeScreenController>().getArtStore();
                          controller.isLoadingPayment(false);
                          // }
                        }
                      },
                      child: Container(
                        height: 5.h,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payment,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "PLACE ORDER",
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 5.h,
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
                      )),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
