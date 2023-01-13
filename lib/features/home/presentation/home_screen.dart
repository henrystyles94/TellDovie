import 'package:camera/camera.dart';
import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/home/presentation/affirmations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../wallet/controller/wallet.dart';
import 'avartar.dart';
import 'calming_journal.dart';
import 'growth_mindset.dart';
import 'info_hub.dart';
import 'mood_tracker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final activities = [
    {'imgPath': 'assets/images/mt.png', 'route': 'moodTrackerPage'},
    {'imgPath': 'assets/images/caj.png', 'route': 'calmingJournalPage'},
    {'imgPath': 'assets/images/gm.png', 'route': 'growthMindset'},
    {'imgPath': 'assets/images/aff.png', 'route': 'affirmations'},
    {'imgPath': 'assets/images/if.png', 'route': 'informationHub'},
    {'imgPath': 'assets/images/avb.png', 'route': 'calmingJournalPage'},
  ];
  final walletController = Get.put(WalletController());
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
              // height: 84.h,
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
                    Obx(
                      () => walletController.isLoading.value
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26.0),
                              child: Row(
                                children: [
                                  Text(
                                    walletController.loadedValue.value.data!,
                                    style: AppStyles()
                                        .smallText
                                        .copyWith(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                          'assets/images/dollar.png'))
                                ],
                              ),
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
                      onTap: () async {
                        if (index == 0) {
                          Get.to(() => const MoodTrackerScreen());
                        } else if (index == 1) {
                          Get.to(() => const CalmingJournalScreen());
                          // Get.toNamed(activities[index]["route"].toString());
                        } else if (index == 2) {
                          await availableCameras()
                              .then((value) => Get.to(() => GrowthMindsetScreen(
                                    cameras: value,
                                  )));
                        } else if (index == 3) {
                          await availableCameras()
                              .then((value) => Get.to(() => AffirmationPage(
                                    cameras: value,
                                  )));
                        } else if (index == 4) {
                          Get.to(() => InformationHubScreen());
                        } else if (index == 5) {
                          Get.to(() => const AvatarScreen());
                        }
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
