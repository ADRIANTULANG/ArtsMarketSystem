import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';

import '../controller/registration_controller.dart';

class RegistrationOtpView extends GetView<RegistrationController> {
  const RegistrationOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Obx(
          () => controller.isChecking.value == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Please Enter OTP.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: OtpTextField(
                        focusedBorderColor: Colors.green,
                        numberOfFields: 6,
                        borderColor: Colors.lightGreen,
                        disabledBorderColor: Colors.lightGreen,
                        enabledBorderColor: Colors.green,
                        fillColor: Colors.lightGreen,
                        showFieldAsBox: true,

                        onCodeChanged: (String code) {},

                        onSubmit: (String verificationCode) async {
                          PhoneAuthCredential phoneAuthCredential =
                              await PhoneAuthProvider.credential(
                                  verificationId: controller.verifIDReceived,
                                  smsCode: verificationCode);

                          controller.signInWithPhoneAuthCredential(
                              phoneAuthCredential, context);
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         title: Text("Verification Code"),
                          //         content: Text('Code entered is $verificationCode'),
                          //       );
                          //     });
                        }, // end onSubmit
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
