import 'package:dovie/constants/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/themes/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/grandma.png'),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Tell Dovie',
              style: AppStyles().headingText,
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Boost your wellbeing',
                  style: AppStyles().mediumText,
                )
              ],
            ),
            SizedBox(
              height: 71.h,
            ),
            CustomButton(
              borderRadius: 30,
              buttonText: 'Let’s Go',
              height: 70.h,
              width: 201.w,
              opnPress: () {
                Get.toNamed('loginPage');
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final String buttonText;
  final VoidCallback opnPress;

  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.buttonText,
    required this.opnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: opnPress,
        child: Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(borderRadius.w)),
          child: Center(
            child: Text(
              buttonText,
              style:
                  AppStyles().mediumText.copyWith(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
