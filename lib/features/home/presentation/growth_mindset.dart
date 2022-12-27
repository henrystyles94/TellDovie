import 'dart:io';

import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GrowthMindsetScreen extends StatelessWidget {
  const GrowthMindsetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset('assets/images/back.png')),
                  SizedBox(
                    width: 97.w,
                  ),
                  Text(
                    'Growth Mindset',
                    style: AppStyles().headingText.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  Image.asset('assets/images/drop.png')
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 600.h,
                    child: FlutterCamera(
                      color: Colors.amber,
                      onImageCaptured: (value) {
                        final path = value.path;
                        print("::::::::::::::::::::::::::::::::: $path");
                        if (path.contains('.jpg')) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Image.file(File(path)),
                                );
                              });
                        }
                      },
                      onVideoRecorded: (value) {
                        final path = value.path;
                        print('::::::::::::::::::::::::;; dkdkkd $path');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    // height: 108.h,
                    width: 210.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        color: AppColors.whiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'When the work gets harder, your brain gets smarter',
                              style: AppStyles().smallText.copyWith(
                                  fontSize: 20, color: AppColors.textBlue),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
