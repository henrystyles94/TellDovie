import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/black_boy_feeder.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/black_lady.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/white_boy.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/white_boy_feeder.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/white_lady.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/white_on_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import 'avatar_animation.dart';
import 'black_onwheel.dart';

class AvatarHeadScreen extends StatelessWidget {
  final selected;
  AvatarHeadScreen({super.key, required this.selected});
  List avatarHead = [
    {'imgPath': 'assets/svg/bhead.png'},
    {'imgPath': 'assets/svg/yellowHair.png'},
    {'imgPath': 'assets/svg/brownHair.png'},
    {'imgPath': 'assets/svg/redHair.png'},
  ];
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
            'Build your avatar',
            style: AppStyles().headingText.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 41.h,
              ),
              Text(
                'Choose a hair colour',
                style: AppStyles().mediumText,
              ),
              SizedBox(
                height: 125.h,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: avatarHead.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 20.w),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(avatarHead[index]);
                        selected == 0 && avatarHead[index] == avatarHead[0]
                            ? Get.to(() => AvatarAnimationScreen())
                            : selected == 0 &&
                                    avatarHead[index] == avatarHead[1]
                                ? Get.to(
                                    () => AvatarAnimationYellowHeadScreen())
                                : selected == 0 &&
                                        avatarHead[index] == avatarHead[2]
                                    ? Get.to(
                                        () => AvatarAnimationBrownHeadScreen())
                                    : selected == 0 &&
                                            avatarHead[index] == avatarHead[3]
                                        ? Get.to(() =>
                                            AvatarAnimationRedHeadScreen())
                                        : selected == 1
                                            ? Get.to(
                                                () => AnimateWhiteBoyScreen())
                                            : selected == 2
                                                ? Get.to(
                                                    () => BlackGirlAnimation())
                                                : selected == 3
                                                    ? Get.to(() =>
                                                        WhiteGirlAnimation())
                                                    : selected == 4
                                                        ? Get.to(() =>
                                                            BlackBoyFeederScreen())
                                                        : selected == 5
                                                            ? Get.to(() =>
                                                                WhiteBoyFeederScreen())
                                                            : selected == 6
                                                                ? Get.to(() =>
                                                                    BlackOnWheeelsScreen())
                                                                : selected == 7
                                                                    ? Get.to(() =>
                                                                        WhiteBoyOnWheel())
                                                                    : BlackGirlAnimation();
                      },
                      child: Container(
                        height: 163.h,
                        width: 177.w,
                        decoration: BoxDecoration(
                            color: AppColors.offWhiteColor,
                            image: DecorationImage(
                                image:
                                    AssetImage(avatarHead[index]['imgPath'])),
                            borderRadius: BorderRadius.circular(20.w)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
