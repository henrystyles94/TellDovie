import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class LessonDetailPage extends StatefulWidget {
  final String title;
  final String image;
  final String desc;
  const LessonDetailPage(
      {Key? key, required this.title, required this.image, required this.desc})
      : super(key: key);

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;
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
        actions: const [
          Icon(
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
                      Text(widget.title,
                          style: AppStyles()
                              .smallText
                              .copyWith(color: AppColors.textColor)),
                      SizedBox(
                        height: 34.h,
                      ),
                      Stack(
                        children: [
                          // Image.network(image),
                          Image.asset('assets/images/star.png')
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.desc,
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
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected = !selected;
                                });
                              },
                              child: Container(
                                height: 106.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selected == true
                                            ? AppColors.whiteColor
                                            : AppColors.lightgreenColor),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20), 
                                        bottomLeft: Radius.circular(20)),
                                    color: AppColors.lightgreenColor),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected2 = !selected2;
                                });
                              },
                              child: Container(
                                height: 106.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selected2 == true
                                            ? AppColors.whiteColor
                                            : AppColors.leafGreen),
                                    color: AppColors.leafGreen),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected3 = !selected3;
                                });
                              },
                              child: Container(
                                height: 106.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selected3 == true
                                            ? AppColors.whiteColor
                                            : AppColors.armyGreen),
                                    color: AppColors.armyGreen),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected4 = !selected4;
                                });
                              },
                              child: Container(
                                height: 106.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selected4 == true
                                            ? AppColors.whiteColor
                                            : AppColors.yellow),
                                    color: AppColors.yellow),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selected5 = !selected5;
                                });
                              },
                              child: Container(
                                height: 106.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selected5 == true
                                            ? AppColors.whiteColor
                                            : AppColors.orange),
                                    color: AppColors.orange),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selected6 = !selected6;
                                  });
                                },
                                child: Container(
                                  height: 106.h,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: selected6 == true
                                              ? AppColors.whiteColor
                                              : AppColors.red),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.w),
                                          bottomRight: Radius.circular(20.w)),
                                      color: AppColors.red),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      CustomButton(
                          isLoading: false,
                          height: 70.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 30.w,
                          buttonText: 'Save Progress',
                          opnPress: () {
                            Get.dialog(const SuccessDialog());
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
