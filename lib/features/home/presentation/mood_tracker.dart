import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:dovie/features/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/styles/app_styles.dart';
import '../../../constants/themes/colors.dart';
import '../controller/activities.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

final affirmationController = Get.put(ActivityController());
String dropdownvalue = '';
int? tappedIndex = -1;
var items = [
  '',
  'Read sime Novel',
  'Play Video',
  'Sing Songs',
  'Talk a walk',
];
var reactions = [
  {'imageSrc': 'assets/images/hap.png', 'title': 'Happy'},
  {'imageSrc': 'assets/images/ex.png', 'title': 'Excited'},
  {'imageSrc': 'assets/images/hope.png', 'title': 'Hopeful'},
  {'imageSrc': 'assets/images/proud.png', 'title': 'Proud'},
  {'imageSrc': 'assets/images/silly.png', 'title': 'Silly'},
  {'imageSrc': 'assets/images/sad.png', 'title': 'Sad'},
  {'imageSrc': 'assets/images/angry.png', 'title': 'Angry'},
  {'imageSrc': 'assets/images/frustrate.png', 'title': 'Frustrated'},
  {'imageSrc': 'assets/images/shy.png', 'title': 'Shy'},
  // {'imageSrc': 'assets/images/add.png', 'title': ''},
];
final activityController = Get.put(ActivityController());
TextEditingController feelingController = TextEditingController();
TextEditingController addTextField = TextEditingController();
AudioPlayer audioPlayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;
final recorder = FlutterSoundRecorder();
File? audioPath;
bool isRecorderReady = false;
Future record() async {
  if (!isRecorderReady) return;
  await recorder.startRecorder(toFile: 'audio');
}

Future stop() async {
  if (!isRecorderReady) return;
  final path = await recorder.stopRecorder();

  File audioFile = File(path!);
  audioPath = audioFile;
    ('RecordedFile = $audioFile');
}

Future initRecorder() async {
  final status = await Permission.microphone.request();
  if (status != PermissionStatus.granted) {
    throw 'Permission denied';
  }
  await recorder.openRecorder();
  recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  isRecorderReady = true;
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  @override
  void initState() {
    initRecorder();
    super.initState();
    tappedIndex = 0;
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/images/back.png')),
        title: Text(
          'How are you feeling',
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   width: 200.w,
              // ),
              SizedBox(
                height: 160.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              left: 29,
                              bottom: 80.h,
                              right: 0,
                              child: Image.asset('assets/images/quest.png')),
                          Positioned(
                            right: 0,
                            child: SizedBox(
                                height: 140.h,
                                child: Image.asset(
                                  'assets/images/grandma.png',
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                // height: 131.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.offWhiteColor,
                  borderRadius: BorderRadius.circular(25.w),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reactions.length + 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: index > 8
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      affirmationController.clicked = true;
                                    });
                                    log('message');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(28.0),
                                    child: Row(
                                      children: [
                                        // Visibility(
                                        //   visible: affirmationController.clicked
                                        //       ? false
                                        //       : true,
                                        //   child: Image.asset(
                                        //     'assets/images/add.png',
                                        //     fit: BoxFit.scaleDown,
                                        //   ),
                                        // ),
                                        InkWell(
                                          onTap: () {
                                            Get.bottomSheet(Container(
                                              height: 200.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.backGroundColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.w),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.w))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Column(
                                                  children: [
                                                    CustomInputField(
                                                      controller: addTextField,
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    CustomButton(
                                                        height: 50.h,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        borderRadius: 10.w,
                                                        buttonText: 'Save',
                                                        opnPress: () {
                                                          Get.back();
                                                          addTextField.clear();
                                                        },
                                                        isLoading: false)
                                                  ],
                                                ),
                                              ),
                                            ));
                                          },
                                          child: Image.asset(
                                            'assets/images/add.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        // Visibility(
                                        //   visible: affirmationController.clicked
                                        //       ? true
                                        //       : false,
                                        //   child: Container(
                                        //       decoration: BoxDecoration(
                                        //           color:
                                        //               AppColors.backGroundColor,
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //                   10.w)),
                                        //       child: Padding(
                                        //         padding:
                                        //             const EdgeInsets.all(8.0),
                                        //         child: Row(
                                        //           children: [
                                        //             Text(
                                        //               'you can type how you feel here',
                                        //               style: AppStyles()
                                        //                   .smallText
                                        //                   .copyWith(
                                        //                       fontSize: 15),
                                        //             ),
                                        //             InkWell(
                                        //                 onTap: () {
                                        //                   setState(() {
                                        //                     affirmationController
                                        //                             .clicked =
                                        //                         false;
                                        //                   });
                                        //                 },
                                        //                 child: Visibility(
                                        //                     visible:
                                        //                         affirmationController
                                        //                                 .clicked
                                        //                             ? true
                                        //                             : false,
                                        //                     child: Icon(
                                        //                       Icons.cancel,
                                        //                       size: 10,
                                        //                     )))
                                        //           ],
                                        //         ),
                                        //       )),
                                        // ),
                                      ],
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      tappedIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55.h,
                                          decoration: BoxDecoration(
                                              color: tappedIndex == index
                                                  ? AppColors.buttonColor
                                                  : AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.w)),
                                          child: Image.asset(reactions[index]
                                                  ['imageSrc']
                                              .toString()),
                                        ),
                                        Text(
                                          reactions[index]['title'].toString(),
                                          style: AppStyles().smallText,
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
              SizedBox(
                height: 38.h,
              ),
              Container(
                // height: 160.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    color: AppColors.offWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            'Dovie would love to know what made you feel this way',
                            style: AppStyles().smallText),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 50.h,
                        child: Text(
                          feelingController.text,
                          style: AppStyles().smallText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                audioPlayer.play(UrlSource(audioPath!.path));
                              },
                              child: const Icon(Icons.play_arrow)),
                          StreamBuilder<RecordingDisposition>(
                            builder: (context, snapshot) {
                              final duration = snapshot.hasData
                                  ? snapshot.data!.duration
                                  : Duration.zero;

                              String twoDigits(int n) =>
                                  n.toString().padLeft(2, '0');
                              final twoDigitsMinutes =
                                  twoDigits(duration.inMinutes.remainder(60));
                              final twoDigitsSeconds =
                                  twoDigits(duration.inSeconds.remainder(60));

                              return Text(
                                '$twoDigitsMinutes: $twoDigitsSeconds',
                                style: AppStyles().smallText,
                              );
                            },
                            stream: recorder.onProgress,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () async {
                              if (recorder.isRecording) {
                                await stop();
                                setState(() {});
                              } else {
                                await record();
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 48.h,
                              width: 48.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.backGroundColor),
                              child: recorder.isRecording
                                  ? Image.asset('assets/images/speak.png')
                                  : Image.asset('assets/images/mic.png'),
                            ),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(Container(
                                height: 150.h,
                                decoration: BoxDecoration(
                                    color: AppColors.backGroundColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.w),
                                        topLeft: Radius.circular(20.w))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CustomInputField(
                                        controller: feelingController,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      CustomButton(
                                          height: 40.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          borderRadius: 10.w,
                                          buttonText: 'Done',
                                          opnPress: () {
                                            Get.back();
                                          },
                                          isLoading: false)
                                    ],
                                  ),
                                ),
                              ));
                            },
                            child: Container(
                              height: 48.h,
                              width: 48.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.backGroundColor),
                              child: Image.asset('assets/images/edit.png'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 49.h,
              ),
              Text(
                'What is something you could do to make yourself feel better?',
                style: AppStyles().smallText,
              ),
              SizedBox(
                height: 23.h,
              ),
              Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    color: AppColors.offWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    isExpanded: true,
                    isDense: true,
                    underline: const SizedBox(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: AppStyles().smallText,
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Obx(
                () => CustomButton(
                    isLoading: activityController.tracking.value,
                    height: 70.h,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 30.w,
                    buttonText: 'Save',
                    opnPress: () {
                      activityController.moodTracker(
                          'sad', feelingController.text, dropdownvalue);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
