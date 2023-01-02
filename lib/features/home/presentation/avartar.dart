import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
         backgroundColor: AppColors.backGroundColor,
          elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text(
          'Build your Avatar',
          style: AppStyles().headingText.copyWith(fontSize: 20),
          
        ),
      ),
      body: Column(
        children: [
          Text('Choose  your Avatar', style: AppStyles().headingText.copyWith(fontSize: 20),),
          SizedBox(height: 50.h,),
          Container(
            height:   163.h,
            width: 177.w,
            decoration: BoxDecoration(
              color: AppColors.offWhiteColor,

              borderRadius: BorderRadius.circular(20.w)
            ),
          )
        ],
      ),
    );
  }
}
