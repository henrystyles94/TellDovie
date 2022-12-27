import 'package:dovie/constants/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({super.key});
  var number = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text('Stats',
            style: AppStyles().headingText.copyWith(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 315.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.w),
              color: AppColors.offWhiteColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mood Tracker',
                      style: AppStyles().smallText,
                    ),
                    Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backGroundColor,
                      ),
                      child: Center(
                        child: Image(
                            image: AssetImage('assets/images/forward.png')),
                      ),
                    )
                  ],
                ),
                Row(
                    // children: [List.generate(number.length, (index) =>  )],
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
