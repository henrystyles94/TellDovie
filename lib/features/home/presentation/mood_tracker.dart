import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

String dropdownvalue = '';
var items = [
  '',
  'Read sime Novel',
  'Play Video',
  'Sing Songs',
  'Talk a walk',
];

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
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
          'How are you feeling',
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
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 200.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  // Container(
                  //   height: 100,
                  //   width: 200,
                  //   margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                  //   decoration: new BoxDecoration(
                  //     color: AppColors.whiteColor,
                  //     borderRadius:
                  //         new BorderRadius.all(Radius.elliptical(100, 50)),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Dovie wants to know \nhow you’re feeling today',
                  //       style: AppStyles().smallText.copyWith(fontSize: 14),
                  //     ),
                  //   ),
                  // ),
                  Image.asset('assets/images/grandma.png'),
                ],
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
                height: 38.h,
              ),
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
                        child: Text(
                            'Dovie would love to know what made you feel this way',
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
                height: 49.h,
              ),
              Text(
                'What is something you could do to make yourself feel better?',
                style: AppStyles().smallText,
              ),
              SizedBox(
                height: 23.h,
              ),
              Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    color: AppColors.offWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    isExpanded: true,
                    isDense: true,
                    underline: SizedBox(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: AppStyles().smallText,
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                  height: 70.h,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 30.w,
                  buttonText: 'Save',
                  opnPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
