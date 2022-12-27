import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import 'login_screen.dart';

class PictureLoginScreen extends StatelessWidget {
  const PictureLoginScreen({super.key});

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
      body: Column(
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
                const CustomInputField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
