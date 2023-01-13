import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../../home/controller/activities.dart';

class WellnesScreen extends StatefulWidget {
  const WellnesScreen({super.key});

  @override
  State<WellnesScreen> createState() => _WellnesScreenState();
}

class _WellnesScreenState extends State<WellnesScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  FlutterTts flutterTts = FlutterTts();
  final activitiesController = Get.put(ActivityController());
  Future initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
// Next, initialize the controller. This returns a Future.
    try {
      await _cameraController!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // initialize the rear camera
    availableCameras().then(
      (value) => initCamera(value[1]),
    );

    activitiesController.earnGrowthPointController();
  }

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 15);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inSeconds.remainder(60));
    final seconds = strDigits(myDuration.inMilliseconds.remainder(60));
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset('assets/images/back.png')),
                  SizedBox(
                    width: 97.w,
                  ),
                  Text(
                    'Growth Mindset',
                    style: AppStyles().headingText.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  Image.asset('assets/images/drop.png')
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 717.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                      ),
                      child: _cameraController != null
                          ? _cameraController!.value.isInitialized
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(30.w),
                                  child: CameraPreview(_cameraController!))
                              : const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.offWhiteColor))
                          : Container()),
                  Positioned(
                    bottom: 60.h,
                    left: 50.w,
                    right: 50.w,
                    child: Container(
                      // height: 108.h,
                      width: 210.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          color: AppColors.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Obx(
                          () => activitiesController.loadingMindset.value
                              ? Container()
                              : Column(
                                  children: List.generate(
                                  activitiesController
                                      .affirmationModel.value.data!.length,
                                  (index) => Text(
                                    activitiesController.loadedGrowthMindsets
                                        .value.data![index].content!,
                                    style: AppStyles().smallText.copyWith(
                                        fontSize: 20,
                                        color: AppColors.textBlue),
                                    textAlign: TextAlign.center,
                                  ),
                                  // Obx(
                                  //   () => affirmationController.isLoading.value
                                  //       ? Container()
                                  //       : Center(
                                  //           child: Text(
                                  //             affirmationController.affirmationModel
                                  //                 .value.data![1].content!,
                                  //             style: AppStyles().smallText.copyWith(
                                  //                 fontSize: 20,
                                  //                 color: AppColors.textBlue),
                                  //             textAlign: TextAlign.center,
                                  //           ),
                                  //         ),
                                  // )
                                )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      // bottom: 50.h,
                      left: MediaQuery.of(context).size.width * 0.04,
                      top: 3.2.h,
                      child: InkWell(
                        onTap: () {
                          startTimer();
                          speak(activitiesController
                              .loadedGrowthMindsets.value.data![0].content
                              .toString());
                        },
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.backGroundColor,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/speak.png'))),
                        ),
                      )),
                  Positioned(
                    top: 10.h,
                    left: MediaQuery.of(context).size.width * 0.3,
                    child: Container(
                      height: 35.h,
                      width: 103.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          border: Border.all(
                              color: AppColors.backGroundColor, width: 3.w)),
                      child: Center(
                        child: Text(
                          '$minutes:$seconds',
                          style: AppStyles()
                              .smallText
                              .copyWith(color: AppColors.backGroundColor),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    startTimer();
    setCountDown();
    _cameraController!.dispose();

    super.dispose();
  }
}
