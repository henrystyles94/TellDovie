import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

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
          'Build your Avatar',
          style: AppStyles().headingText.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              'Choose  your Avatar',
              style: AppStyles().headingText.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20.w),
                itemBuilder: (context, index) {
                  return Container(
                    height: 163.h,
                    width: 177.w,
                    decoration: BoxDecoration(
                        color: AppColors.offWhiteColor,
                        image: DecorationImage(
                            image: AssetImage('assets/images/avar.png')),
                        borderRadius: BorderRadius.circular(20.w)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
