import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/avatar_animation_whitegirl_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/avatar_animation_whitegirl_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/avatar_animation_whitegirl_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/feeder/white_girl_feeder_black_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/feeder/white_girl_feeder_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/feeder/white_girl_feeder_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/feeder/white_girl_feeder_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/wheelchair/wheelchair_black_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/wheelchair/wheelchair_brown_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/wheelchair/wheelchair_red_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/wheelchair/wheelchair_yellow_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/girls/white_girl/white_lady.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:get/get.dart';
import '../../../constants/styles/app_styles.dart';

class LadiesPonytail extends StatelessWidget {
  final selected;
  LadiesPonytail({super.key, this.selected});

  List avatarHead = [
    {'imgPath': 'assets/svg/pony-black.png'},
    {'imgPath': 'assets/svg/ponytail-yellow.png'},
    {'imgPath': 'assets/svg/ponytail-brown.png'},
    {'imgPath': 'assets/svg/ponytail-red.png'},
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
                        // selected == 0
                        //     ? Get.to(() => AvatarAnimationScreen())
                        //     : selected == 1
                        //         ? Get.to(() => AnimateWhiteBoyScreen())
                        //         :
                        selected == 3 && avatarHead[index] == avatarHead[0]
                            ? Get.to(() => WhiteGirlAnimation())
                            : selected == 3 &&
                                    avatarHead[index] == avatarHead[1]
                                ? Get.to(() => WhiteGirlYellowHeadAnimation())
                                : selected == 3 &&
                                        avatarHead[index] == avatarHead[2]
                                    ? Get.to(
                                        () => WhiteGirlBrownHeadAnimation())
                                    : selected == 3 &&
                                            avatarHead[index] == avatarHead[3]
                                        ? Get.to(
                                            () => WhiteGirlRedHeadAnimation())
                                        :
                                        //
                                        //
                                        selected == 7 &&
                                                avatarHead[index] ==
                                                    avatarHead[0]
                                            ? Get.to(() =>
                                                WhiteGirlBlackHeadFeederScreen())
                                            : selected == 7 &&
                                                    avatarHead[index] ==
                                                        avatarHead[1]
                                                ? Get.to(() =>
                                                    WhiteGirlYellowHeadFeederScreen())
                                                : selected == 7 &&
                                                        avatarHead[index] ==
                                                            avatarHead[2]
                                                    ? Get.to(() =>
                                                        WhiteGirlBrownHeadFeederScreen())
                                                    : selected == 7 &&
                                                            avatarHead[index] ==
                                                                avatarHead[3]
                                                        ? Get.to(() =>
                                                            WhiteGirlRedHeadFeederScreen())
                                                        :
                                                        //
                                                        //
                                                        selected == 11 &&
                                                                avatarHead[index] ==
                                                                    avatarHead[
                                                                        0]
                                                            ? Get.to(() =>
                                                                WhiteGirlWheelChairBlackHeadScreen())
                                                            : selected == 11 &&
                                                                    avatarHead[index] ==
                                                                        avatarHead[
                                                                            1]
                                                                ? Get.to(() =>
                                                                    WhiteGirlWheelChairYellowHeadScreen())
                                                                : selected ==
                                                                            11 &&
                                                                        avatarHead[index] ==
                                                                            avatarHead[2]
                                                                    ? Get.to(() => WhiteGirlWheelChairBrownHeadScreen())
                                                                    : selected == 11 && avatarHead[index] == avatarHead[3]
                                                                        ? Get.to(() => WhiteGirlWheelChairRedHeadScreen())
                                                                        : Container();
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
