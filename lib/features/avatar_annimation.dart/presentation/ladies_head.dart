import 'package:dovie/features/avatar_annimation.dart/presentation/girls/avatar_animation_blackgirl_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/avatar_animation_blackgirl_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/avatar_animation_blackgirl_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/feeder/black_girl_feeder_black_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/feeder/black_girl_feeder_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/feeder/black_girl_feeder_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/feeder/black_girl_feeder_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/wheelchair/wheelchair_black_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/wheelchair/wheelchair_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/wheelchair/wheelchair_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/blackgirl/wheelchair/wheelchair_yellow_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/black_lady.dart';
import 'package:get/get.dart';
import '../../../constants/styles/app_styles.dart';

class LadiesHairScren extends StatelessWidget {
  final selected;
  LadiesHairScren({super.key, this.selected});

  List avatarHead = [
    {'imgPath': 'assets/svg/bgirl-bhead.png'},
    {'imgPath': 'assets/svg/bgirl-yhead.png'},
    {'imgPath': 'assets/svg/bgirl-brhead.png'},
    {'imgPath': 'assets/svg/bgirl-rhead.png'},

    // {'imgPath': 'assets/svg/yellowHair.png'},
    // {'imgPath': 'assets/svg/brownHair.png'},
    // {'imgPath': 'assets/svg/redHair.png'},
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
                        print('object');

                        //
                        //
                        selected == 2 && avatarHead[index] == avatarHead[0]
                            ? Get.to(() => BlackGirlAnimation())
                            : selected == 2 &&
                                    avatarHead[index] == avatarHead[1]
                                ? Get.to(() => BlackGirlYellowHeadAnimation())
                                : selected == 2 &&
                                        avatarHead[index] == avatarHead[2]
                                    ? Get.to(
                                        () => BlackGirlBrownHeadAnimation())
                                    : selected == 2 &&
                                            avatarHead[index] == avatarHead[3]
                                        ? Get.to(
                                            () => BlackGirlRedHeadAnimation())
                                        :
                                        //
                                        //
                                        selected == 6 &&
                                                avatarHead[index] ==
                                                    avatarHead[0]
                                            ? Get.to(() =>
                                                BlackGirlBlackHeadFeederScreen())
                                            : selected == 6 &&
                                                    avatarHead[index] ==
                                                        avatarHead[1]
                                                ? Get.to(() =>
                                                    BlackGirlYellowHeadFeederScreen())
                                                : selected == 6 &&
                                                        avatarHead[index] ==
                                                            avatarHead[2]
                                                    ? Get.to(() =>
                                                        BlackGirlBrownHeadFeederScreen())
                                                    : selected == 6 &&
                                                            avatarHead[index] ==
                                                                avatarHead[3]
                                                        ? Get.to(() =>
                                                            BlackGirlRedHeadFeederScreen())
                                                        :
                                                        //
                                                        //
                                                        selected == 10 &&
                                                                avatarHead[index] ==
                                                                    avatarHead[
                                                                        0]
                                                            ? Get.to(() =>
                                                                BlackGirlWheelChairBlackHeadScreen())
                                                            : selected == 10 &&
                                                                    avatarHead[index] ==
                                                                        avatarHead[
                                                                            1]
                                                                ? Get.to(() =>
                                                                    BlackGirlWheelChairYellowHeadScreen())
                                                                : selected ==
                                                                            10 &&
                                                                        avatarHead[index] ==
                                                                            avatarHead[2]
                                                                    ? Get.to(() => BlackGirlWheelChairBrownHeadScreen())
                                                                    : selected == 10 && avatarHead[index] == avatarHead[3]
                                                                        ? Get.to(() => BlackGirlWheelChairRedHeadScreen())
                                                                        :
                                                                        // selected == 4
                                                                        //     ? Get.to(() => BlackBoyFeederScreen())
                                                                        //     : selected == 5
                                                                        //         ? Get.to(() => WhiteBoyFeederScreen())
                                                                        //         : selected == 6
                                                                        //             ? Get.to(
                                                                        //                 () => BlackOnWheeelsScreen())
                                                                        //             : selected == 7
                                                                        //                 ? Get.to(
                                                                        //                     () => WhiteBoyOnWheel())
                                                                        //                 :
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
