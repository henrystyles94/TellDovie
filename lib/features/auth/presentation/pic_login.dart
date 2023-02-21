import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../../widgets/custom_input.dart';
import '../controller/auth_controller.dart';

class PictureLoginScreen extends StatefulWidget {
  PictureLoginScreen({super.key});

  @override
  State<PictureLoginScreen> createState() => _PictureLoginScreenState();
}

class _PictureLoginScreenState extends State<PictureLoginScreen> {
  final authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  var loginImages = [
    {
      'imgPath': 'assets/images/journal.png',
      'value': 0,
    },
    {
      'imgPath': 'assets/images/mouse.png',
      'value': 1,
    },
    {
      'imgPath': 'assets/images/scoot.png',
      'value': 2,
    },
    {
      'imgPath': 'assets/images/robot.png',
      'value': 3,
    },
    {
      'imgPath': 'assets/images/burger.png',
      'value': 4,
    },
    {
      'imgPath': 'assets/images/lab.png',
      'value': 5,
    },
    {
      'imgPath': 'assets/images/bag.png',
      'value': 6,
    },
    {
      'imgPath': 'assets/images/vault.png',
      'value': 7,
    },
    {
      'imgPath': 'assets/images/aba.png',
      'value': 8,
    },
  ];

  var selected = [];
  var password = [];
  var newPass = '';

  @override
  Widget build(BuildContext context) {
    var userPassword = password;
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
          mainAxisSize: MainAxisSize.min,
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Pin',
                    style: AppStyles().smallText,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    width: MediaQuery.of(context).size.width,
                    // color: AppColors.whiteColor,
                    child: selected.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteColor,
                                    shape: BoxShape.circle),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: selected.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 60.h,
                                  width: 60.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.greenColor),
                                  child:
                                      Image.asset(selected[index]['imgPath']),
                                ),
                              );
                            }),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                    child: Text(
                      'Select Your Pin and Login',
                      style: AppStyles().smallText,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 320.h,
                    child: GridView.builder(
                      itemCount: loginImages.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (selected.length < 4) {
                                selected.add(loginImages[index]);

                                password.add(
                                    loginImages[index]['value'].toString());
                              } else {
                                Get.snackbar('title', 'message');
                              }
                              print(password);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.w),
                                color: AppColors.offWhiteColor,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "${loginImages[index]['imgPath']}",
                                  ),
                                )),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20.w,
                        // childAspectRatio: 1.1,
                        // mainAxisSpacing: 10
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Divider(
                    color: AppColors.buttonColor,
                  ),
                  Center(
                    child: Text(
                      'Try a different method',
                      style: AppStyles()
                          .smallText
                          .copyWith(color: AppColors.buttonColor),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Obx(
                    () => CustomButton(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 20.w,
                        buttonText: 'Login',
                        opnPress: () {
                          authController.loginUserController(
                              emailController.text.trim(), userPassword.join());
                          setState(() {
                            selected.clear();
                          });
                        },
                        isLoading: authController.isLoading.value),
                  ),
                  SizedBox(
                    height: 30.h,
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
