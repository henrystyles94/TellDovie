import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/features/auth/presentation/welcome_screen.dart';
import 'package:dovie/features/home/presentation/mood_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants/themes/colors.dart';
import '../../widgets/custom_input.dart';
import '../controller/activities.dart';

class CalmingJournalScreen extends StatefulWidget {
  const CalmingJournalScreen({super.key});

  @override
  State<CalmingJournalScreen> createState() => _CalmingJournalScreenState();
}

final activityController = Get.put(ActivityController());
AudioPlayer audioPlayer = AudioPlayer();
bool isPlaying = false;
Duration duration = Duration.zero;
Duration position = Duration.zero;
final recorder = FlutterSoundRecorder();
File? audioPath;
String? newPath;
bool isRecorderReady = false;
Future record() async {
  if (!isRecorderReady) return;
  await recorder.startRecorder(
    codec: Codec.aacMP4,
    toFile: 'audio.mp4',
  );
}

Future stop() async {
  if (!isRecorderReady) return;
  final path = await recorder.stopRecorder();

  final audioFile = File(path!);
  audioPath = audioFile;
  newPath = path;
  print('RecordedFile = $audioFile');
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

class _CalmingJournalScreenState extends State<CalmingJournalScreen> {
  String dropdownvalue = '';

  var items = [
    '',
    'I did not complete my work',
    'I may have distracted my friends',
    'I upset others',
    'I upset myself',
    'I have an idea'
  ];

  String actionvalue = '';
  int? tappedIndex = -1;
  var actionitems = [
    '',
    'Read a book',
    'Talk to a friend',
    'Talk to a teacher',
    'Focus on my breathing',
    'I have an idea'
  ];
  var reactions = [
    // {'imageSrc': 'assets/images/hap.png', 'title': 'Happy'},
    {'imageSrc': 'assets/images/ex.png', 'title': 'Excited'},
    // {'imageSrc': 'assets/images/hope.png', 'title': 'Hopeful'},
    {'imageSrc': 'assets/images/proud.png', 'title': 'Proud'},
    // {'imageSrc': 'assets/images/silly.png', 'title': 'Silly'},
    {'imageSrc': 'assets/images/sad.png', 'title': 'Sad'},
    {'imageSrc': 'assets/images/angry.png', 'title': 'Angry'},
    {'imageSrc': 'assets/images/frustrate.png', 'title': 'Frustrated'},
    {'imageSrc': 'assets/images/shy.png', 'title': 'Shy'},
    // {'imageSrc': 'assets/images/add.png', 'title': 'type how you feel'},
  ];
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

  TextEditingController journalController = TextEditingController();
  TextEditingController addFeelings = TextEditingController();
  TextEditingController outComeController = TextEditingController();
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
          'Reflect, Rewind, Renew',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        child: Text('You can tell us what happened',
                            style: AppStyles().smallText),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        journalController.text,
                        style: AppStyles().smallText,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                audioPlayer.play(UrlSource(audioPath!.path));
                                setState(() {
                                  isPlaying = true;
                                });
                              },
                              child: isPlaying == true
                                  ? Icon(Icons.pause)
                                  : Icon(Icons.play_arrow)),
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
                                        controller: journalController,
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
                height: 38.h,
              ),
              Text(
                'How did you feel?',
                style: AppStyles().headingText.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 15.h,
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
                          child: index > 5
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
                                    // print(tappedIconValue);
                                    // print(reactions[index].length);

                                    tappedIndex = index;
                                    val = index;
                                    if (tappedIndex == 0) {
                                      val = 'excited';
                                    } else if (tappedIndex == 1) {
                                      val = 'proud';
                                    } else if (tappedIndex == 2) {
                                      val = 'sad';
                                    } else if (tappedIndex == 3) {
                                      val = 'angry';
                                    } else if (tappedIndex == 4) {
                                      val = 'frustrated';
                                    } else if (tappedIndex == 5) {
                                      val = 'shy';

                                      // tappedIconValue = index;
                                    }
                                    setState(() {});
                                    print(index);
                                    print(val);
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
                height: 30.h,
              ),
              Text(
                'What was the outcome of your choice?',
                style: AppStyles().headingText.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 8.h,
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
                      if (newValue == 'I have an idea') {
                        Get.bottomSheet(Container(
                          height: 200.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.backGroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.w),
                                  topRight: Radius.circular(10.w))),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                CustomInputField(
                                  controller: addFeelings,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomButton(
                                    height: 50.h,
                                    width: MediaQuery.of(context).size.width,
                                    borderRadius: 10.w,
                                    buttonText: 'Save',
                                    opnPress: () {
                                      Get.back();
                                    },
                                    isLoading: false)
                              ],
                            ),
                          ),
                        ));
                      }
                      setState(() {
                        dropdownvalue = newValue!;
                        // dropdownvalue = addFeelings.text;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Text(
              //   outComeController.text,
              //   style: AppStyles().smallText,
              // ),
              Text(
                addFeelings.text,
                style: AppStyles().smallText,
              ),
              SizedBox(
                height: 41.h,
              ),
              Text(
                'What can you do to make it better?',
                style: AppStyles().headingText.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    color: AppColors.offWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    // Initial Value
                    value: actionvalue,
                    isExpanded: true,
                    isDense: true,
                    underline: const SizedBox(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: actionitems.map((String actionitems) {
                      return DropdownMenuItem(
                        value: actionitems,
                        child: Text(
                          actionitems,
                          style: AppStyles().smallText,
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will

                    onChanged: (String? newValue) {
                      if (newValue == 'I have an idea') {
                        Get.bottomSheet(Container(
                          height: 200.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColors.backGroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.w),
                                  topRight: Radius.circular(10.w))),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                CustomInputField(
                                  controller: outComeController,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomButton(
                                    height: 50.h,
                                    width: MediaQuery.of(context).size.width,
                                    borderRadius: 10.w,
                                    buttonText: 'Save',
                                    opnPress: () {
                                      Get.back();
                                    },
                                    isLoading: false)
                              ],
                            ),
                          ),
                        ));
                      }
                      setState(() {
                        actionvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Text(
                outComeController.text,
                style: AppStyles().smallText,
              ),
              SizedBox(
                height: 66.h,
              ),
              Obx(
                () => CustomButton(
                    height: 70.h,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: 25.w,
                    buttonText: 'Save',
                    isLoading: activityController.sendingJournal.value,
                    opnPress: () {
                      activityController.calmingJournalController(
                        newPath,
                        val,
                        journalController.text,
                        dropdownvalue,
                        actionvalue,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
