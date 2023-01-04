import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../../home/controller/activities.dart';
import 'lesson_detail.dart';

class LessonScreen extends StatelessWidget {
  LessonScreen({super.key});
  final activitiesController = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text(
          'Lessons',
          style: AppStyles().headingText.copyWith(
                fontSize: 20,
              ),
        ),
        actions: [
          const Icon(
            Icons.more_vert_sharp,
            color: AppColors.greenColor,
          )
        ],
      ),
      body: Obx(
        () => activitiesController.loadingLessons.value
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 3,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 10.h,
                  ),
                  itemCount:
                      activitiesController.loadedLessonModel.value.data!.length,
                  itemBuilder: (context, index) {
                    var lessons = activitiesController
                        .loadedLessonModel.value.data![index];
                    return InkWell(
                      onTap: () {
                        Get.to(() => LessonDetailPage(
                              title: lessons.title!,
                              image: lessons.image!,
                              desc: lessons.description!,
                            ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style: AppStyles().smallText.copyWith(fontSize: 14),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            // height: 184.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppColors.offWhiteColor,
                                borderRadius: BorderRadius.circular(20.w)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  lessons.title!,
                                  style: AppStyles().smallText,
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      lessons.description!,
                                      textAlign: TextAlign.center,
                                      style: AppStyles().smallText.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Text(
                                  'Check your progress',
                                  style: AppStyles()
                                      .smallText
                                      .copyWith(color: AppColors.buttonColor),
                                ),
                                SizedBox(
                                  height: 16.h,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
