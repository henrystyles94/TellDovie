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
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 200.w,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/elipse.png'),
                  Positioned(
                    top: 40.h,
                    child: Text(
                      'Dovie wants to know \nhow you’re feeling today',
                      style: AppStyles().smallText.copyWith(fontSize: 17),
                    ),
                  )
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Positioned(
                    top: 50.h,
                    child: SizedBox(
                        height: 111.h,
                        child: Image.asset('assets/images/grandma.png')),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
