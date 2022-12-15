import 'package:dovie/constants/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors.dart';

class CalmingJournalScreen extends StatelessWidget {
  const CalmingJournalScreen({super.key});

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
          'Reflect, Rewind, Renew',
          style: AppStyles().headingText.copyWith(
                fontSize: 20,
              ),
        ),
        actions: [
          const Icon(
            Icons.more_vert_sharp,
            color: AppColors.greenColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 160.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: AppColors.offWhiteColor),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                      width: MediaQuery.of(context).size.width,
                      child: Text('You can tell us what happened',
                          style: AppStyles().smallText),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.backGroundColor),
                          child: Image.asset('assets/images/mic.png'),
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.backGroundColor),
                          child: Image.asset('assets/images/edit.png'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            Text(
              'How did you feel?',
              style: AppStyles().headingText.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              // height: 131.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.offWhiteColor,
                borderRadius: BorderRadius.circular(25.w),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/images/frustrate.png'),
                          Text(
                            'Frustrated',
                            style: AppStyles().smallText,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/angry.png'),
                          Text('Angry', style: AppStyles().smallText)
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/lonley.png'),
                          Text(
                            'Lonely',
                            style: AppStyles().smallText,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        children: [
                          Image.asset('assets/images/sad.png'),
                          Text(
                            'Sad',
                            style: AppStyles().smallText,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'What was the outcome of your choice?',
              style: AppStyles().headingText.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: AppColors.offWhiteColor),
            )
          ],
        ),
      ),
    );
  }
}
