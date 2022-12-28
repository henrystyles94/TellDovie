import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';

class AffirmationPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const AffirmationPage({super.key, this.cameras});

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  CameraController? _cameraController;

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
    initCamera(widget.cameras![1]);
  }

  @override
  Widget build(BuildContext context) {
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
                  Image.asset('assets/images/drop.png')
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
                          : const Center(child: CircularProgressIndicator())),
                  Positioned(
                    bottom: 150.h,
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
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'When the work gets harder, your brain gets smarter',
                                style: AppStyles().smallText.copyWith(
                                    fontSize: 20, color: AppColors.textBlue),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 50.h,
                      left: MediaQuery.of(context).size.width * 0.35,
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.backGroundColor,
                            image: DecorationImage(
                                image: AssetImage('assets/images/speak.png'))),
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
                          '00:45',
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
    ;
  }
}
