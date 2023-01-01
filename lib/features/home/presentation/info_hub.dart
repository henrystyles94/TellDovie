import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class InformationHubScreen extends StatelessWidget {
  InformationHubScreen({super.key});

  var info = [
    {'name': 'Self control board game'},
    {'name': 'Let’s get social'},
    {'name': 'Meditation for kids'},
    {'name': 'Mindfulness Crafts'},
    {'name': 'Arts and Crafts'},
    {'name': 'Name that emotion'},
    {'name': 'Breath your way to calm'},
    {'name': 'Positive poetry'},
  ];
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
          'Growth Hub',
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
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: info.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 50.h),
                itemBuilder: (context, index) {
                  return Container(
                    height: 76.h,
                    width: 189.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: AppColors.offWhiteColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          info[index]['name'].toString(),
                          style: AppStyles().smallText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              isLoading: false,
                height: 70.h,
                width: MediaQuery.of(context).size.width,
                borderRadius: 30.w,
                buttonText: 'Kids Monthly Newsletter',
                opnPress: () {})
          ],
        ),
      ),
    );
  }
}
