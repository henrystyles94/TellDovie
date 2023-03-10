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
          // leading: InkWell(
          //     onTap: () {
          //       Get.back();
          //     },
          //     child: Image.asset('assets/images/back.png')),
          title: Text(
            'Lessons',
            style: AppStyles().headingText.copyWith(
                  fontSize: 20,
                ),
          ),
          actions: const [
            Icon(
              Icons.more_vert_sharp,
              color: AppColors.greenColor,
            )
          ],
        ),
        body: Scaffold(
            backgroundColor: AppColors.backGroundColor,
            body: ListView(children: [
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
                        // InkWell(
                        //   onTap: () {
                        //     Get.back();
                        //     print('click click');
                        //   },
                        //   child: Image.asset('assets/images/back.png'),
                        // ),
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
                    top: ScreenSize.getHeight(120),
                    left: ScreenSize.getHeight(20),
                    right: ScreenSize.getHeight(20),
                    child: Center(
                      child: Text(
                        'Coming soon',
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
                  'Example:',
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
                  'LO: To write an informative report',
                  style: AppStyles().mediumText.copyWith(
                        fontSize: 18,
                        // fontFamily: 'Fredoka',
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(
                  5,
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
                  'SC: I can carry out research on a topic of my choice.',
                  style: AppStyles().mediumText.copyWith(
                        fontSize: 18,
                        // fontFamily: 'Fredoka',
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(
                  5,
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
                  'SC: I can organize a report into key features.',
                  style: AppStyles().mediumText.copyWith(
                        fontSize: 18,
                        // fontFamily: 'Fredoka',
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(
                  5,
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
                  'SC: I can include fun facts.',
                  style: AppStyles().mediumText.copyWith(
                        fontSize: 18,
                        // fontFamily: 'Fredoka',
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: ScreenSize.getHeight(30),
              ),
            ]))

        // body: Obx(
        //   () => activitiesController.loadingLessons.value
        //       ? const Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.whiteColor,
        //             strokeWidth: 3,
        //           ),
        //         )
        //       : Padding(
        //           padding: const EdgeInsets.all(32.0),
        //           child: ListView.separated(
        //             separatorBuilder: (BuildContext context, int index) =>
        //                 Divider(
        //               height: 10.h,
        //             ),
        //             itemCount:
        //                 activitiesController.loadedLessonModel.value.data!.length,
        //             itemBuilder: (context, index) {
        //               var lessons = activitiesController
        //                   .loadedLessonModel.value.data![index];
        //               return InkWell(
        //                 onTap: () {
        //                   Get.to(() => LessonDetailPage(
        //                         title: lessons.title!,
        //                         image: lessons.image!,
        //                         desc: lessons.description!,
        //                       ));
        //                 },
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'Today',
        //                       style: AppStyles().smallText.copyWith(fontSize: 14),
        //                     ),
        //                     SizedBox(
        //                       height: 3.h,
        //                     ),
        //                     Container(
        //                       // height: 184.h,
        //                       width: MediaQuery.of(context).size.width,
        //                       decoration: BoxDecoration(
        //                           color: AppColors.offWhiteColor,
        //                           borderRadius: BorderRadius.circular(20.w)),
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: [
        //                           SizedBox(
        //                             height: 15.h,
        //                           ),
        //                           Text(
        //                             lessons.title!,
        //                             style: AppStyles().smallText,
        //                           ),
        //                           SizedBox(
        //                             height: 24.h,
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Center(
        //                               child: Text(
        //                                 lessons.description!,
        //                                 textAlign: TextAlign.center,
        //                                 style: AppStyles().smallText.copyWith(
        //                                     fontSize: 20,
        //                                     fontWeight: FontWeight.w100),
        //                               ),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             height: 24.h,
        //                           ),
        //                           Text(
        //                             'Check your progress',
        //                             style: AppStyles()
        //                                 .smallText
        //                                 .copyWith(color: AppColors.buttonColor),
        //                           ),
        //                           SizedBox(
        //                             height: 16.h,
        //                           )
        //                         ],
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        // ),
        );
  }
}
