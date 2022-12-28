import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/features/home/model/bar_chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../constants/themes/colors.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({super.key});
  var number = ['1', '2', '3', '11', '5', '6', '7', '8', '9'];
  final List<BarChartModel> data = [
    BarChartModel(
        year: '🤨',
        financial: 450,
        color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
    BarChartModel(
        year: '😉',
        financial: 300,
        color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
    BarChartModel(
        year: '👨',
        financial: 180,
        color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
    BarChartModel(
        year: '😁',
        financial: 210,
        color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
    BarChartModel(
        year: '😀',
        financial: 350,
        color: charts.ColorUtil.fromDartColor(AppColors.buttonColor)),
  ];
  @override
  Widget build(BuildContext context) {
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
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text('Stats',
            style: AppStyles().headingText.copyWith(fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
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
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.backGroundColor,
                  height: 15.h,
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  return Container(
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
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: AppColors.backGroundColor),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    '29',
                                    style: AppStyles().mediumText,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
