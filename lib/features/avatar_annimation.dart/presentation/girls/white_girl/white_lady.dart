import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../constants/styles/app_styles.dart';
import '../../../../../constants/themes/colors.dart';
import '../../../controller/avatar_animation.dart';

class WhiteGirlAnimation extends StatefulWidget {
  WhiteGirlAnimation({super.key});

  @override
  State<WhiteGirlAnimation> createState() => _WhiteGirlAnimation();
}

final animationController = Get.put(AvatarAnimationController());

class _WhiteGirlAnimation extends State<WhiteGirlAnimation> {
  bool selectedItem1 = false;

  var items = [
    {'imgPath': 'assets/svg/yu.jpg'},
    {'imgPath': 'assets/svg/pcap.png'},
    {'imgPath': 'assets/svg/bat.png'},

    {'imgPath': 'assets/svg/c.png'},
    // {'imgPath': 'assets/svg/.png'},
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Obx(
                () => Row(
                  children: [
                    animationController.selectedItem.value == 0
                        ? Image.asset('assets/svg/wgn.png')
                        : animationController.selectedItem.value == 1
                            ? Image.asset('assets/svg/wgwc.png')
                            : animationController.selectedItem.value == 2
                                ? Image.asset('assets/svg/wgwbat.png')
                                : animationController.selectedItem.value == 3
                                    ? Image.asset('assets/svg/wgwcr.png')
                                    // : animationController.selectedItem.value ==
                                    //         4
                                    //     ? Image.asset('assets/svg/bgwcr.png')
                                    : Image.asset('assets/svg/whiteN.png'),
                  ],
                ),
              ),
              SizedBox(
                height: 58.h,
              ),
              Text(
                'Get an Item',
                style: AppStyles().smallText,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 56.h,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Obx(
                          () => InkWell(
                            onTap: () {
                              animationController.selectedItem.value = index;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Container(
                                height: 66.h,
                                width: 66.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    border: Border.all(
                                        color: animationController
                                                    .selectedItem.value ==
                                                index
                                            ? AppColors.red
                                            : AppColors.whiteColor),
                                    color: AppColors.whiteColor,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            '${items[index]['imgPath']}'))),
                              ),
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) => Divider(
                            height: 180.w,
                          ),
                      itemCount: items.length),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (animationController.selectedItem.value > 0) {
                        animationController.selectedItem.value =
                            animationController.selectedItem.value - 1;
                      }
                    },
                    child: Container(
                      height: 79.h,
                      width: 79.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.buttonColor),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 59.w,
                  ),
                  InkWell(
                    onTap: () {
                      if (animationController.selectedItem.value <
                          items.length) {
                        animationController.selectedItem.value =
                            animationController.selectedItem.value + 1;
                      }
                    },
                    child: Container(
                      height: 79.h,
                      width: 79.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.buttonColor),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 20.w,
                  buttonText: 'Save',
                  opnPress: () {
                    Get.snackbar('Saved', 'Avatar saved',
                        backgroundColor: AppColors.buttonColor,
                        colorText: AppColors.whiteColor);
                  },
                  isLoading: false)
            ],
          ),
        ),
      ),
    );
  }
}
