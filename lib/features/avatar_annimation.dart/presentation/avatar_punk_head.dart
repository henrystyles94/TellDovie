import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_animation_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/wheelchair/wheelchair_black_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/wheelchair/wheelchair_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/wheelchair/wheelchair_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/wheelchair/wheelchair_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/white_boy_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/white_boy_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/boys/white_boy/white_boy_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/white_boy.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/black_boy_feeder.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/girls/black_lady.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/white_boy.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/white_boy_feeder.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/white_lady.dart';
// import 'package:dovie/features/avatar_annimation.dart/presentation/white_on_wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import 'avatar_animation.dart';
// import 'black_onwheel.dart';

class AvatarPunkHeadScreen extends StatelessWidget {
  final selected;
  AvatarPunkHeadScreen({super.key, required this.selected});
  List avatarHead = [
    {'imgPath': 'assets/svg/whiteboy/punk-black.png'},
    {'imgPath': 'assets/svg/whiteboy/punk-yellow.png'},
    {'imgPath': 'assets/svg/whiteboy/punk-brown.png'},
    {'imgPath': 'assets/svg/whiteboy/punk-red.png'},
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
                        print(avatarHead[0]);
                        selected == 1 && avatarHead[index] == avatarHead[0]
                            ? Get.to(() => AnimateWhiteBoyScreen())
                            : selected == 1 &&
                                    avatarHead[index] == avatarHead[1]
                                ? Get.to(
                                    () => AnimatedWhiteBoyYellowHeadScreen())
                                : selected == 1 &&
                                        avatarHead[index] == avatarHead[2]
                                    ? Get.to(
                                        () => AnimatedWhiteBoyBrownHeadScreen())
                                    : selected == 1 &&
                                            avatarHead[index] == avatarHead[3]
                                        ? Get.to(() =>
                                            AnimatedWhiteBoyRedHeadScreen())
                                        // :
                                        //selected == 1
                                        //     ? Get.to(
                                        //         () => AnimateWhiteBoyScreen())
                                        //     : selected == 2
                                        //         ? Get.to(
                                        //             () => BlackGirlAnimation())
                                        //         : selected == 3
                                        //             ? Get.to(() =>
                                        //                 WhiteGirlAnimation())
                                        //             : selected == 4
                                        //                 ? Get.to(() =>
                                        //                     BlackBoyFeederScreen())
                                        // : selected == 5
                                        //     ? Get.to(() =>
                                        //         WhiteBoyFeederScreen())
                                        :
                                        //selected == 6
                                        //                         ? Get.to(() =>
                                        //                             BlackOnWheeelsScreen())
                                        //                         :
                                        selected == 7 &&
                                                avatarHead[index] ==
                                                    avatarHead[0]
                                            ? Get.to(() =>
                                                WhiteBoyWheelChairBlackHeadScreen())
                                            : selected == 7 &&
                                                    avatarHead[index] ==
                                                        avatarHead[1]
                                                ? Get.to(() =>
                                                    WhiteBoyWheelChairYellowHeadScreen())
                                                : selected == 7 &&
                                                        avatarHead[index] ==
                                                            avatarHead[2]
                                                    ? Get.to(() =>
                                                        WhiteBoyWheelChairBrownHeadScreen())
                                                    : selected == 7 &&
                                                            avatarHead[index] ==
                                                                avatarHead[3]
                                                        ? Get.to(() =>
                                                            WhiteBoyWheelChairRedHeadScreen())
                                                        :
                                                        // BlackGirlAnimation();
                                                        Container();
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
