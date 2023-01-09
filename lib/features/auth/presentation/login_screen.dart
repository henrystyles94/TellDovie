// ignore_for_file: must_be_immutable

import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/custom_input.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final authController = Get.put(AuthController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300.h,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/curve.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0.w,
                  ),
                  child: Text(
                    'Login',
                    style: AppStyles()
                        .headingText
                        .copyWith(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                    right: 0.0, child: Image.asset('assets/images/sun.png')),
                Positioned(
                    top: 100.0.h,
                    left: 0.0,
                    child: Image.asset('assets/images/cloud.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: AppStyles().smallText,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomInputField(
                    controller: emailController,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 57.h,
                  ),
                  Text(
                    'Pin',
                    style: AppStyles().smallText,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  PinCodeTextField(
                    controller: passwordController,
                    appContext: context,
                    backgroundColor: AppColors.backGroundColor,

                    pastedTextStyle: const TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    // 538692
                    obscureText: false,
                    // obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "";
                      } else {
                        return null;
                      }
                    },

                    pinTheme: PinTheme(
                      inactiveFillColor: AppColors.whiteColor,
                      inactiveColor: AppColors.whiteColor,
                      shape: PinCodeFieldShape.circle,
                      selectedFillColor: AppColors.whiteColor,
                      disabledColor: AppColors.whiteColor,
                      borderWidth: 0.6,
                      fieldHeight: 66.h,
                      borderRadius: BorderRadius.circular(10.w),
                      fieldWidth: 66.w,
                      activeFillColor: AppColors.whiteColor,
                    ),
                    textStyle: AppStyles().smallText,
                    cursorColor: AppColors.whiteColor,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,

                    onCompleted: (v) {},

                    onChanged: (value) {
                      if (value.isEmpty) {
                        authController.isTextEmpty.value = true;
                      } else {
                        authController.isTextEmpty.value = false;
                      }
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    color: AppColors.buttonColor,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('picLogin');
                    },
                    child: Center(
                      child: Text(
                        'Try a different method',
                        style: AppStyles()
                            .smallText
                            .copyWith(color: AppColors.buttonColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Obx(
                    () => CustomButton(
                        height: 70.h,
                        width: 382.w,
                        borderRadius: 30.w,
                        buttonText: 'Login',
                        isLoading: authController.isLoading.value,
                        opnPress: () {
                          authController.loginUserController(
                              emailController.text.trim(),
                              passwordController.text.trim());
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
