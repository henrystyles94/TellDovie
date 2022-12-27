import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final activities = [
    {'imgPath': 'assets/images/mt.png', 'route': 'moodTrackerPage'},
    {'imgPath': 'assets/images/caj.png', 'route': 'calmingJournalPage'},
    {'imgPath': 'assets/images/gm.png', 'route': 'growthMindset'},
    {'imgPath': 'assets/images/aff.png', 'route': 'calmingJournalPage'},
    {'imgPath': 'assets/images/if.png', 'route': 'informationHub'},
    {'imgPath': 'assets/images/avb.png', 'route': 'calmingJournalPage'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 84.h,
              width: 131.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.whiteColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You have:',
                        style: AppStyles().smallText.copyWith(fontSize: 14)),
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text(
                            '150',
                            style: AppStyles().smallText.copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Expanded(
                              child: Image.asset('assets/images/dollar.png'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Text(
                'What activity are you doing today?',
                textAlign: TextAlign.center,
                style: AppStyles()
                    .headingText
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: activities.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(activities[index]["route"].toString());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(activities[index]['imgPath']
                                      .toString()))),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
