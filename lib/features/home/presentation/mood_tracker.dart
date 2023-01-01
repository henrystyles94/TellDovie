import 'dart:developer';

import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../controller/affirmations.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

final affirmationController = Get.put(AffirmationController());
String dropdownvalue = '';
var items = [
  '',
  'Read sime Novel',
  'Play Video',
  'Sing Songs',
  'Talk a walk',
];
var reactions = [
  {'imageSrc': 'assets/images/hap.png', 'title': 'Happy'},
  {'imageSrc': 'assets/images/ex.png', 'title': 'Excited'},
  {'imageSrc': 'assets/images/hope.png', 'title': 'Hopeful'},
  {'imageSrc': 'assets/images/proud.png', 'title': 'Proud'},
  {'imageSrc': 'assets/images/silly.png', 'title': 'Silly'},
  {'imageSrc': 'assets/images/sad.png', 'title': 'Sad'},
  {'imageSrc': 'assets/images/angry.png', 'title': 'Angry'},
  {'imageSrc': 'assets/images/frustrate.png', 'title': 'Frustrated'},
  {'imageSrc': 'assets/images/shy.png', 'title': 'Shy'},
  // {'imageSrc': 'assets/images/add.png', 'title': ''},
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
                  Container(
                    height: 100,
                    width: 200,
                    margin: EdgeInsets.only(top: 40, left: 40, right: 40),
                    decoration: new BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          new BorderRadius.all(Radius.elliptical(100, 50)),
                    ),
                    child: Center(
                      child: Text(
                        'Dovie wants to know \nhow you’re feeling today',
                        style: AppStyles().smallText.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 160.h,
                        child: Image.asset(
                          'assets/images/grandma.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
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
                  child: SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reactions.length + 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: index > 8
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      affirmationController.clicked = true;
                                    });
                                    log('message');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(28.0),
                                    child: Row(
                                      children: [
                                        Visibility(
                                          visible: affirmationController.clicked
                                              ? false
                                              : true,
                                          child: Image.asset(
                                            'assets/images/add.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        Visibility(
                                          visible: affirmationController.clicked
                                              ? true
                                              : false,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.backGroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'you can type how you feel here',
                                                      style: AppStyles()
                                                          .smallText
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            affirmationController
                                                                    .clicked =
                                                                false;
                                                          });
                                                        },
                                                        child: Visibility(
                                                            visible:
                                                                affirmationController
                                                                        .clicked
                                                                    ? true
                                                                    : false,
                                                            child: Icon(
                                                                Icons.cancel)))
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 55.h,
                                        child: Image.asset(reactions[index]
                                                ['imageSrc']
                                            .toString()),
                                      ),
                                      Text(
                                        reactions[index]['title'].toString(),
                                        style: AppStyles().smallText,
                                      )
                                    ],
                                  ),
                                ),
                        );
                      },
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
                  isLoading: false,
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
