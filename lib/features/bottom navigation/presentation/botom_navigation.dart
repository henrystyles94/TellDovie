import 'package:dovie/features/home/presentation/home_screen.dart';
import 'package:dovie/features/lesson/presentation/lesson.dart';
import 'package:dovie/features/statistics/presentation/statistics.dart';
import 'package:dovie/features/wellness/presentation/wellness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../controller/bottom_nav.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);
  final navController = Get.put(NavController());
  final List<Widget> screenContents = [
    HomeScreen(),
    const WellnesScreen(),
    const LessonScreen(),
    const StaticsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: navController.selectedIndex == 0
          ? AppColors.offWhiteColor
          : AppColors.offWhiteColor,
      body: Obx(
        () => Center(
          child: screenContents.elementAt(navController.selectedIndex),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: Obx(() => BottomNavigationBar(
              selectedLabelStyle: AppStyles().smallText,
              backgroundColor: navController.selectedIndex == 0
                  ? AppColors.offWhiteColor
                  : AppColors.offWhiteColor,
              selectedItemColor: AppColors.greenColor,
              unselectedItemColor: AppColors.greyColor.withOpacity(0.2),
              unselectedFontSize: 10,
              unselectedLabelStyle: AppStyles().smallText,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: AppColors.offWhiteColor,
                  icon: SizedBox(
                      height: 18.h,
                      child: Image.asset('assets/images/home.png',
                          color: navController.selectedIndex == 0
                              ? AppColors.greenColor
                              : AppColors.greyColor)),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.offWhiteColor,
                  icon: SizedBox(
                      height: 18.h,
                      child: Image.asset('assets/images/smile.png',
                          color: navController.selectedIndex == 1
                              ? AppColors.greenColor
                              : AppColors.greyColor)),
                  label: 'Wellness',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.offWhiteColor,
                  icon: SizedBox(
                      height: 28.h,
                      child: Image.asset('assets/images/book.png',
                          color: navController.selectedIndex == 3
                              ? AppColors.greenColor
                              : AppColors.greyColor)),
                  label: 'Lesson',
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.offWhiteColor,
                  icon: SizedBox(
                      height: 18.h,
                      child: Image.asset('assets/images/Chart.png',
                          color: navController.selectedIndex == 4
                              ? AppColors.greenColor
                              : AppColors.greyColor)),
                  label: 'Stat',
                ),
              ],
              currentIndex: navController.selectedIndex,
              onTap: (index) => navController.selectedIndex = index,
            )),
      ),
    );
  }
}
