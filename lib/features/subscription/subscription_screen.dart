import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/styles/radio_button.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:dovie/features/subscription/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/subscription.dart';

class SubscriptionScreen extends StatefulWidget {
  SubscriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final subController = Get.put(SubscriptionController());
  bool v1 = false;

  bool v2 = false;
  bool isChecked = false;
  String yearly = '47';
  String monthly = '8';
  String type1 = '1';
  String type2 = '12';

  double? amount;
  var duration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Obx(() => subController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.yellow,
                ),
              )
            : subController.loadedPlans.value.data!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Oopps seems your internet is broken',
                          style: AppStyles().mediumText,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButton(
                            height: 30.h,
                            width: 70.w,
                            borderRadius: 10.w,
                            buttonText: 'back',
                            opnPress: () {
                              Get.back();
                            },
                            isLoading: false)
                      ],
                    ),
                  )
                : ListView(children: [
                    Stack(
                      children: [
                        Positioned(
                            // top: 0,
                            // left: 0,
                            // right: 0,
                            child: Container(
                          height: ScreenSize.getHeight(
                            370,
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/sub-curve.png',
                                ),
                                fit: BoxFit.fill),
                          ),
                        )),
                        Positioned(
                          top: ScreenSize.getHeight(30),
                          left: ScreenSize.getHeight(20),
                          right: ScreenSize.getHeight(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  print('click click');
                                },
                                child: Image.asset('assets/images/back.png'),
                              ),
                              Image.asset(
                                'assets/images/star.png',
                                width: ScreenSize.getWidth(79),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: ScreenSize.getHeight(50),
                          left: ScreenSize.getHeight(2),
                          right: ScreenSize.getHeight(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/sun.png',
                                width: ScreenSize.getWidth(76),
                              ),
                              // Image.asset('assets/images/star.png'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: ScreenSize.getHeight(150),
                          left: ScreenSize.getHeight(20),
                          right: ScreenSize.getHeight(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/cloud-face.png',
                                width: ScreenSize.getWidth(125),
                              ),
                              // Image.asset('assets/images/star.png'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: ScreenSize.getHeight(220),
                          left: ScreenSize.getHeight(20),
                          right: ScreenSize.getHeight(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/heart.png',
                                width: ScreenSize.getWidth(39),
                              ),
                              // Image.asset('assets/images/star.png'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: ScreenSize.getHeight(170),
                          left: ScreenSize.getHeight(20),
                          right: ScreenSize.getHeight(20),
                          child: Center(
                            child: Text(
                              'Dovie',
                              style: AppStyles().headingText.copyWith(
                                    fontSize: 40,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Unlock the full Dovie \n Experience!',
                        textAlign: TextAlign.center,
                        style: AppStyles().mediumText.copyWith(
                              fontSize: ScreenSize.getHeight(24),
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Image.asset(
                          'assets/images/tick.png',
                          width: ScreenSize.getWidth(39),
                        ),
                      ),
                      title: Text(
                        'Track your student’s mood and well-being with daily/monthly reports.',
                        style: AppStyles().mediumText.copyWith(
                              fontSize: 18,
                              // fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.getHeight(
                        20,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Image.asset(
                          'assets/images/tick.png',
                          width: ScreenSize.getWidth(39),
                        ),
                      ),
                      title: Text(
                        'Build higher levels of self-esteem increase motivation & low moods with our growth mindset stations.',
                        style: AppStyles().mediumText.copyWith(
                              fontSize: 18,
                              // fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.getHeight(
                        20,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Image.asset(
                          'assets/images/tick.png',
                          width: ScreenSize.getWidth(39),
                        ),
                      ),
                      title: Text(
                        'Watch your student’s behaviour transform with our calming journal; designed to support pupils with self and Co-Regulation.',
                        style: AppStyles().mediumText.copyWith(
                              fontSize: 18,
                              // fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.getHeight(
                        20,
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Image.asset(
                          'assets/images/tick.png',
                          width: ScreenSize.getWidth(39),
                        ),
                      ),
                      title: Text(
                        'Full access to a student information hub. Monthly mindfulness activities, team building games, news letters and much more…',
                        style: AppStyles().mediumText.copyWith(
                              fontSize: 18,
                              // fontFamily: 'Fredoka',
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    Obx(
                      () => SizedBox(
                        height: 150.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              height: 10.h,
                              color: AppColors.backGroundColor,
                            ),
                            itemCount:
                                subController.loadedPlans.value.data!.length,
                            itemBuilder: (context, index) {
                              var plans =
                                  subController.loadedPlans.value.data![index];
                              return InkWell(
                                onTap: () {
                                  subController.isTapped.value = int.parse(
                                      subController
                                          .loadedPlans.value.data![index].id
                                          .toString());
                                  print(subController.isTapped.value);
                                  setState(() {
                                    amount = double.parse(subController
                                        .loadedPlans.value.data![index].price
                                        .toString());
                                    duration = subController
                                        .loadedPlans.value.data![index].duration
                                        .toString();
                                  });
                                },
                                child: Container(
                                  height: 50.h,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: ScreenSize.getWidth(
                                      30,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      color: AppColors.whiteColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${plans.name}',
                                          style: AppStyles().smallText,
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${plans.price}',
                                          style: AppStyles().mediumText,
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: subController
                                                          .isTapped.value ==
                                                      subController.loadedPlans
                                                          .value.data![index].id
                                                  ? AppColors.buttonColor
                                                  : AppColors.offWhiteColor,
                                              border: Border.all(
                                                  color:
                                                      AppColors.buttonColor)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() =>
                            PaymentScreen(amount: amount, duration: duration));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenSize.getWidth(
                            30,
                          ),
                          vertical: ScreenSize.getWidth(
                            30,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.getWidth(
                            20,
                          ),
                          // vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Try free and subscribe',
                          textAlign: TextAlign.center,
                          style: AppStyles().mediumText.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(
                          30,
                        ),
                      ),
                      child: Text(
                        '7 Day trial, cancel anytime in app store',
                        textAlign: TextAlign.center,
                        style: AppStyles().mediumText.copyWith(
                              fontSize: 14,
                              // color: Colors.white,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.getHeight(30),
                    ),
                  ])));
  }
}
