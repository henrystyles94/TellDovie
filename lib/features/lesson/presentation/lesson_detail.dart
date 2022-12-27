import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text(
          'Lessons',
          style: AppStyles()
              .headingText
              .copyWith(fontSize: 20, color: AppColors.greenColor),
        ),
        actions: [
          const Icon(
            Icons.more_vert_sharp,
            color: AppColors.greenColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 751.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.offWhiteColor,
                    borderRadius: BorderRadius.circular(20.w)),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      Text('Reading',
                          style: AppStyles()
                              .smallText
                              .copyWith(color: AppColors.textColor)),
                      SizedBox(
                        height: 34.h,
                      ),
                      Stack(
                        children: [
                          Image.asset('assets/images/bk.png'),
                          Image.asset('assets/images/star.png')
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Understanding basics, lexis and structure of the english language, comprehend texts and identify key details.',
                          style: AppStyles().smallText.copyWith(
                              fontSize: 20, color: AppColors.textColor),
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Text(
                        'How much progress are you making in this lesson?',
                        style: AppStyles().smallText,
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Container(
                        height: 106.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(20.w)),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      CustomButton(
                          height: 70.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 30.w,
                          buttonText: 'Save Progress',
                          opnPress: () {
                            Get.dialog(SuccessDialog());
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 171.h),
      child: Container(
          height: 449.h,
          width: 382.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              color: AppColors.offWhiteColor),
          child: Image.asset('assets/images/check.png')),
    );
  }
}
