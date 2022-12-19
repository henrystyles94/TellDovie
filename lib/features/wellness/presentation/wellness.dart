import 'package:flutter/material.dart';

import '../../../constants/themes/colors.dart';

class WellnesScreen extends StatelessWidget {
  const WellnesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
      ),
    );
  }
}
