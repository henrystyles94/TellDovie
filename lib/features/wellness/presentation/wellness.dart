import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class WellnesScreen extends StatelessWidget {
  const WellnesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            // height: 717.h,
            alignment: Alignment.center,
            width: 343.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                color: AppColors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 35.h,
                    width: 103.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.w),
                        border: Border.all(
                            color: AppColors.backGroundColor, width: 2)),
                    child: Center(
                      child: Text(
                        '00:30',
                        style: AppStyles().smallText.copyWith(
                            color: AppColors.backGroundColor, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 441.h,
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
                  SizedBox(
                    height: 35.h,
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backGroundColor,
                    ),
                    child: Center(child: Image.asset('assets/images/speak.png')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
