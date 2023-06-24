import 'dart:convert';
import 'package:ams/pages/artdetailsscreen/controller/artdetailsscreen_controller.dart';
import 'package:ams/pages/homescreen/controller/homescreen_controller.dart';
import 'package:ams/services/session_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../services/storage_services.dart';
import '../../artofartistscreen/controller/art_of_artist_controller.dart';
import '../../homescreen/model/homescreen_model.dart';

class PaymentController extends GetxController {
  RxList<ArtStores> selectedArt = <ArtStores>[].obs;
  Map<String, dynamic>? paymentIntentData;
  RxString amount = "0.0".obs;
  // RxString currency = "PHP".obs;
  // RxString artistID = "".obs;
  // RxString artID = "".obs;
  RxBool isStripeSelected = false.obs;
  RxBool isCODSelected = true.obs;
  RxBool isLoadingPayment = false.obs;

  @override
  void onInit() async {
    getSelectedArts();
    // amount.value = await Get.arguments['amount'];
    // artistID.value = await Get.arguments['artistID'];
    // artID.value = await Get.arguments['artID'];
    // makePayment(amount: amount.value, currency: currency.value);
    super.onInit();
  }

  getSelectedArts() async {
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>()
              .artStores_masterList[i]
              .isSelected
              .value ==
          true) {
        selectedArt
            .add(Get.find<HomeScreenController>().artStores_masterList[i]);
      }
    }
    print(selectedArt.length);
    calculateTotal();
  }

  calculateTotal() {
    amount.value = "0.0";
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>()
              .artStores_masterList[i]
              .isSelected
              .value ==
          true) {
        amount.value = (double.parse(amount.value) +
                double.parse(Get.find<HomeScreenController>()
                    .artStores_masterList[i]
                    .price
                    .toString()))
            .toStringAsFixed(2);
      }
    }
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      // final paymentMethod =
      //           await Stripe.instance.createPaymentMethod(PaymentMethodParams.card(
      //             paymentMethodData: PaymentMethodData (billingDetails: BillingD)
      //           ));
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        print(amount);
        print(currency);
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          // applePay: PaymentSheetApplePay(merchantCountryCode: currency),
          googlePay: PaymentSheetGooglePay(merchantCountryCode: "PHP"),

          merchantDisplayName: 'Prospects',
          customerId: Get.find<StorageServices>().storage.read('accntId'),
          // sk_test_51Lize7DbhTM8s4NtDpmRR7iPcppW41EG2AYCHLmJjopgdCnUUP85FQVvmEt98rCnpnr59xQd6zOP7D4kfkMDXqKM00ejfzOuph
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        print("here");

        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      for (var i = 0; i < selectedArt.length; i++) {
        if (selectedArt[i].isSelected.value == true) {
          await transactAmount(
              artID: selectedArt[i].id,
              artistID: selectedArt[i].accountId,
              customerID: Get.find<StorageServices>().storage.read('accntId'));
        }
      }
      if (Get.isRegistered<ArtDetailsScreenController>() == false) {
        Get.back();
      } else {
        Get.back();
        Get.back();
      }
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2));
      Get.find<HomeScreenController>().getArtStore();

      isLoadingPayment(false);
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    var amountString = double.parse(amount).toInt();
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amountString.toString()),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51Lize7DbhTM8s4NtDpmRR7iPcppW41EG2AYCHLmJjopgdCnUUP85FQVvmEt98rCnpnr59xQd6zOP7D4kfkMDXqKM00ejfzOuph',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  transactAmount(
      {required String artID,
      required String artistID,
      required String customerID}) async {
    var result = await Session.transact(
        customerAccountId: customerID, artistAccountId: artistID, artId: artID);
    if (result == true) {
    } else {
      Get.snackbar('Payment', 'Please try again later',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 2));
    }
  }

  transactAmountCOD(
      {required String artID,
      required String artistID,
      required String customerID}) async {
    var result = await Session.transact(
        customerAccountId: customerID, artistAccountId: artistID, artId: artID);
    if (result == true) {
    } else {}
  }

  setToTrue({required String artid}) {
    if (Get.isRegistered<ArtOfArtist>() == true) {
      for (var i = 0;
          i < Get.find<ArtOfArtist>().artist_arts_list.length;
          i++) {
        if (Get.find<ArtOfArtist>().artist_arts_list[i].id == artid) {
          Get.find<ArtOfArtist>().artist_arts_list[i].isSelected.value = true;
        }
      }
    }
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>().artStores_masterList[i].id ==
          artid) {
        Get.find<HomeScreenController>()
            .artStores_masterList[i]
            .isSelected
            .value = true;
      }
    }
  }

  setToFalse({required String artid}) {
    if (Get.isRegistered<ArtOfArtist>() == true) {
      for (var i = 0;
          i < Get.find<ArtOfArtist>().artist_arts_list.length;
          i++) {
        if (Get.find<ArtOfArtist>().artist_arts_list[i].id == artid) {
          Get.find<ArtOfArtist>().artist_arts_list[i].isSelected.value = true;
        }
      }
    }
    for (var i = 0;
        i < Get.find<HomeScreenController>().artStores_masterList.length;
        i++) {
      if (Get.find<HomeScreenController>().artStores_masterList[i].id ==
          artid) {
        Get.find<HomeScreenController>()
            .artStores_masterList[i]
            .isSelected
            .value = true;
      }
    }
  }
}
