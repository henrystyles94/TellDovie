import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/styles/radio_button.dart';
import 'package:dovie/constants/themes/colors.dart';
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

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Obx(
        () => subController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.yellow,
                ),
              )
            : ListView(
                children: [
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

                  //
                  // CHECKBOX 1
                  //

                  InkWell(
                    onTap: () {
                      setState(() {
                        monthly = '8';
                        type1 = '1';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(
                          20,
                        ),
                        vertical: ScreenSize.getHeight(
                          30,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(
                          20,
                        ),
                        vertical: ScreenSize.getHeight(
                          15,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subController.loadedPlans.value.data![0].name ==
                                    null
                                ? ''
                                : '${subController.loadedPlans.value.data![0].name}',
                            textAlign: TextAlign.center,
                            style: AppStyles().mediumText.copyWith(
                                  fontSize: ScreenSize.getHeight(24),
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '\$ ${subController.loadedPlans.value.data![0].amount} / MO',
                            textAlign: TextAlign.center,
                            style: AppStyles().mediumText.copyWith(
                                  fontSize: ScreenSize.getHeight(24),
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: AppColors.buttonColor,
                            ),
                            child: MyRadioOption<String>(
                              value: '1',
                              groupValue: _groupValue,
                              onChanged: _valueChangedHandler(),
                              label: '1',
                              icon: Icons.circle_rounded,
                              // text: 'Phone Gap',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //
                  // CHECKBOX 2
                  //

                  InkWell(
                    onTap: () {
                      setState(() {
                        yearly = '47';
                        type2 = '12';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(
                          20,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getWidth(
                          20,
                        ),
                        vertical: ScreenSize.getHeight(
                          15,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenSize.getWidth(
                                    30,
                                  ),
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor.withOpacity(
                                    0.6,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Popular',
                                  textAlign: TextAlign.center,
                                  style: AppStyles().mediumText.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${subController.loadedPlans.value.data![1].name}',
                                textAlign: TextAlign.center,
                                style: AppStyles().mediumText.copyWith(
                                      fontSize: ScreenSize.getHeight(20),
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width:
                                ScreenSize.getWidth(ScreenSize.getHeight(24)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$ ${subController.loadedPlans.value.data![1].amount} / MO',
                                    textAlign: TextAlign.end,
                                    style: AppStyles().mediumText.copyWith(
                                          fontSize: 20,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              // Text(
                              //   '\$ 46.99 / MO',
                              //   textAlign: TextAlign.center,
                              //   style: AppStyles().mediumText.copyWith(
                              //         fontSize: 20,
                              //       ),
                              // ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              MyRadioOption<String>(
                                value: '2',
                                groupValue: _groupValue,
                                onChanged: _valueChangedHandler(),
                                label: '1',
                                icon: Icons.circle_rounded,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //
                  //
                  //
                  InkWell(
                    onTap: () {
                      print(type1);
                      Get.bottomSheet(
                        SizedBox(
                          height: 200.h,
                          child: PaymentScreen(
                              amount: yearly != '47' ? '8' : '8',
                              duration: type1 != '1' ? '12' : '1'),
                        ),
                      );
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
                  //
                  //
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
                ],
              ),
      ),
    );
  }
}
