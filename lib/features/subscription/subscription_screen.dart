import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/styles/radio_button.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  SubscriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool v1 = false;
  bool v2 = false;
  bool isChecked = false;

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
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
              'Track your studentz\’s mood and well being withdaily/ monthly reports,',
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
              'Build your student’s confidence and self esteem with the Affirmation and Growth mindset station',
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
              'Watch your student’s behaviour transform  with our calming journal. Designed to support your students with self regulating and verbalising their emotions. ',
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
              'Full access to the student information hub. Self control, team building games and monthly student newsletter.',
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

          Container(
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
                  '1 Month',
                  textAlign: TextAlign.center,
                  style: AppStyles().mediumText.copyWith(
                        fontSize: ScreenSize.getHeight(24),
                      ),
                ),
                const Spacer(),
                Text(
                  '\$ 7.99 / MO',
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

          //
          // CHECKBOX 2
          //

          Container(
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
                      'School Year',
                      textAlign: TextAlign.center,
                      style: AppStyles().mediumText.copyWith(
                            fontSize: ScreenSize.getHeight(20),
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  width: ScreenSize.getWidth(ScreenSize.getHeight(24)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$ 95.99 / MO',
                          textAlign: TextAlign.end,
                          style: AppStyles().mediumText.copyWith(
                                fontSize: 20,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Text(
                      '\$ 46.99 / MO',
                      textAlign: TextAlign.center,
                      style: AppStyles().mediumText.copyWith(
                            fontSize: 20,
                          ),
                    ),
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
          ), //
          //
          //
          Container(
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
    );
  }
}
