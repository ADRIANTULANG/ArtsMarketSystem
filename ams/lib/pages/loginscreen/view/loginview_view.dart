import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../registrationscreen/view/registration_view.dart';
import '../controller/loginscreen_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 40.h,
                width: 100.w,
                alignment: Alignment.center,
                child:
                    Image(image: AssetImage("assets/images/amslogotoobig.png")),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 8.h,
                width: 100.w,
                child: TextField(
                  controller: controller.username,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    labelText: 'User name',
                    hintText: 'Enter username',
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 8.h,
                width: 100.w,
                child: Obx(
                  () => TextField(
                    controller: controller.password,
                    obscureText: controller.isPasswordObscure.value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          if (controller.isPasswordObscure.value == true) {
                            controller.isPasswordObscure.value = false;
                          } else {
                            controller.isPasswordObscure.value = true;
                          }
                        },
                        child: Obx(
                          () => Icon(
                            Icons.remove_red_eye,
                            color: controller.isPasswordObscure.value
                                ? Colors.grey[400]
                                : Colors.green,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      labelText: 'Password',
                      hintText: 'Enter password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Obx(
                () => controller.isGettingCredentials.value == false
                    ? Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: InkWell(
                          onTap: () {
                            if (controller.username.text.isNotEmpty &&
                                controller.password.text.isNotEmpty) {
                              controller.login();
                            } else {
                              Get.snackbar(
                                "Message",
                                "Oops, Missing Input",
                                colorText: Colors.white,
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: Container(
                            height: 8.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 182, 221, 184),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black54)),
                            alignment: Alignment.center,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                letterSpacing: 4,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          height: 8.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 182, 221, 184),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.black54)),
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    InkWell(
                      onTap: () {
                        // LoginDialog.showDialogSignup();
                        Get.to(() => RegistrationView());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
