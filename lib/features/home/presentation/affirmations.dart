import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dovie/features/home/presentation/growth_mindset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../../wallet/controller/wallet.dart';
import '../controller/activities.dart';

class AffirmationPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const AffirmationPage({super.key, this.cameras});

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  CameraController? _cameraController;
  FlutterTts flutterTts = FlutterTts();

  final affirmationController = Get.put(ActivityController());
  final walletController = Get.put(WalletController());

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
    affirmationController.earnAffirmationPointsController();
    initCamera(widget.cameras![1]);
    startTimer();
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

        Get.snackbar(
          'Yaeee',
          'You have just earned some Dovie points',
          backgroundColor: AppColors.backGroundColor,
        );
        Get.bottomSheet(Image.asset('assets/images/succ.jpg'));
        walletController.walletController();
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

  @override
  void dispose() {
    startTimer();
    setCountDown();
    super.dispose();
  }

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inSeconds.remainder(60));
    final seconds = strDigits(myDuration.inMicroseconds.remainder(60));
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
                    width: 67.w,
                  ),
                  Text(
                    'Affirmation Station',
                    style: AppStyles().headingText.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  PopupMenuButton(
                      // color: AppColors.backGroundColor,
                      icon: Icon(Icons.arrow_drop_down),
                      onSelected: (value) async {
                        if (value == 0) {
                          await availableCameras()
                              .then((value) => Get.to(() => GrowthMindsetScreen(
                                    cameras: value,
                                  )));
                          // Get.to(() => GrowthMindsetScreen());
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            height: 50.h,
                            child: Text('Growth mindset'),
                            value: 0,
                          )
                        ];
                      })
                  // InkWell(
                  //     onTap: () {
                  //       Get
                  //       // Get.to(GrowthMindsetScreen());
                  //     },
                  //     child: Image.asset('assets/images/drop.png'))
                ],
              ),
              SizedBox(
                height: 10.h,
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
                      child: _cameraController!.value.isInitialized
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(30.w),
                              child: CameraPreview(_cameraController!))
                          : const Center(
                              child: CircularProgressIndicator(
                              color: AppColors.offWhiteColor,
                            ))),
                  Positioned(
                    bottom: 50.h,
                    left: 50.w,
                    right: 50.w,
                    child: affirmationController.affirm[selectedIndex]
                                ['content'] ==
                            null
                        ? Container()
                        : Container(
                            // height: 108.h,
                            width: 210.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: AppColors.whiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                children: [
                                  Text(
                                    affirmationController.affirm[selectedIndex]
                                        ['content']!,
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

                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                      // bottom: 50.h,
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: 4.4,
                      child: InkWell(
                        onTap: () {
                          startTimer();
                          speak(affirmationController.affirmationModel.value
                              .data![selectedIndex].content
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
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.w,
                    child: InkWell(
                      onTap: () {
                        if (affirmationController.affirm.length - 1 ==
                            selectedIndex) {
                          return;
                        }
                        setState(() {
                          selectedIndex = selectedIndex + 1;
                        });
                        print('omo $selectedIndex');
                      },
                      child:
                          // affirmationController.affirm[selectedIndex]
                          //             ['content'] ==
                          //         null
                          //     ? Container()
                          //     :

                          Container(
                        height: 30.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            border: Border.all(
                                color: AppColors.backGroundColor, width: 2.w)),
                        child: const Icon(
                          Icons.next_plan_outlined,
                          color: AppColors.backGroundColor,
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
}
