import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/avatar_punk_head.dart';
import 'package:dovie/features/avatar_annimation.dart/presentation/ladies_ponytail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../avatar_annimation.dart/presentation/ladies_head.dart';

class AvatarScreen extends StatelessWidget {
  AvatarScreen({super.key});
  List avatars = [
    {'imgPath': 'assets/svg/blackStand.png'},
    {'imgPath': 'assets/svg/whiteBoyStand.png'},
    {'imgPath': 'assets/svg/girlStand.png'},
    {'imgPath': 'assets/svg/whiteGrilStand.png'},
    {'imgPath': 'assets/svg/blackBFeed.png'},
    {'imgPath': 'assets/svg/whiteBFeed.png'},
    // {'imgPath': 'assets/svg/bGF.png'},
    // {'imgPath': 'assets/svg/whiteGF.png'},
    {'imgPath': 'assets/svg/bweel.png'},
    {'imgPath': 'assets/svg/wweel.png'},
    // {'imgPath': 'assets/svg/bgweel.png'},
    // {'imgPath': 'assets/svg/wgweel.png'},
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
          'Build your Avatar',
          style: AppStyles().headingText.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              'Choose your Avatar',
              style: AppStyles().headingText.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: avatars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20.w),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // print(index);
                      if (index == 1 || index == 5 || index == 7) {
                        Get.to(() => AvatarPunkHeadScreen(selected: index));
                      } else if (index == 2) {
                        Get.to(() => LadiesHairScren(
                              selected: index,
                            ));
                      } else if (index == 3) {
                        Get.to(() => LadiesPonytail(
                              selected: index,
                            ));
                      } else {
                        Get.to(() => AvatarHeadScreen(
                              selected: index,
                            ));
                      }
                    },
                    child: Container(
                      height: 163.h,
                      width: 177.w,
                      decoration: BoxDecoration(
                          color: AppColors.offWhiteColor,
                          image: DecorationImage(
                              image: AssetImage(avatars[index]['imgPath'])),
                          borderRadius: BorderRadius.circular(20.w)),
                    ),
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
