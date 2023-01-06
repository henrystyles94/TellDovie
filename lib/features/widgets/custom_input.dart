
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dovie/constants/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/themes/colors.dart';

class CustomInputField extends StatelessWidget {
  final controller;
  const CustomInputField({
    Key? key, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles().smallText,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          fillColor: AppColors.whiteColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: AppColors.whiteColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: AppColors.whiteColor,
              width: 2.0,
            ),
          ),
          filled: true,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(40.w))),
    );
  }
}
