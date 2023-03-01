// ignore_for_file: must_be_immutable

import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/features/auth/presentation/login_screen.dart';
import 'package:dovie/features/home/model/bar_chart_model.dart';
import 'package:dovie/features/subscription/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/themes/colors.dart';
import '../controller/stats_controlle.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({super.key});
  // var number = ['1', '2', '3', '11', '5', '6', '7', '8', '9'];
  final statsController = Get.put(StatController());

  @override
  Widget build(BuildContext context) {
    final List<BarChartModel> data = [
      statsController.isLoading.value
          ? BarChartModel(
              year: '😬',
              financial: statsController.loadedStats.value.stat!["anxious"]!,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor))
          : BarChartModel(
              year: '😁',
              financial: 0,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
      statsController.isLoading.value
          ? BarChartModel(
              year: '😬',
              financial: statsController.loadedStats.value.stat!["sad"]!,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor))
          : BarChartModel(
              year: '😬',
              financial: 0,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
      statsController.isLoading.value
          ? BarChartModel(
              year: '😬',
              financial: statsController.loadedStats.value.stat!["hopeful"]!,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor))
          : BarChartModel(
              year: '😍',
              financial: 0,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
      statsController.isLoading.value
          ? BarChartModel(
              year: '😬',
              financial: statsController.loadedStats.value.stat!["excited"]!,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor))
          : BarChartModel(
              year: '😔',
              financial: 0,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
      statsController.isLoading.value
          ? BarChartModel(
              year: '😬',
              financial: statsController.loadedStats.value.stat!["angry"]!,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor))
          : BarChartModel(
              year: '😉',
              financial: 0,
              color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
    ];
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: 'financial',
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      )
    ];
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () => Get.to(
              () => SubscriptionScreen(),
            ),
            child: Image.asset(
              'assets/images/dollar.png',
              width: ScreenSize.getWidth(25),
            ),
          ),
          InkWell(
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              Get.offAll(() => LoginScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(
                Icons.logout_outlined,
                color: AppColors.black,
                size: 20.h,
              ),
            ),
          )
        ],
        // leading: InkWell(
        //     onTap: () {
        //       Get.back();
        //     },
        //     child: Image.asset('assets/images/back.png')),
        title: Text('Stats',
            style: AppStyles().headingText.copyWith(fontSize: 20)),
        centerTitle: true,
      ),
      body: Obx(
        () => statsController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 315.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            color: AppColors.offWhiteColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: charts.BarChart(
                              series,
                              animate: true,
                            ),
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Report',
                        style: AppStyles().headingText.copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Container(
                            // height: 156.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: AppColors.offWhiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Text(
                                    'How many journal you have completed this month',
                                    style: AppStyles().smallText,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 46.h,
                                      width: 56.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: AppColors.backGroundColor),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            statsController
                                                .loadedStats.value.journal
                                                .toString(),
                                            style: AppStyles().mediumText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            // height: 156.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: AppColors.offWhiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  Text(
                                    'How many affirmations/growth mindset you have completed this month',
                                    style: AppStyles().smallText,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 46.h,
                                      width: 56.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                          color: AppColors.backGroundColor),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            statsController
                                                .loadedStats.value.affirmGrowth
                                                .toString(),
                                            style: AppStyles().mediumText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
