import 'package:dovie/constants/styles/app_styles.dart';
import 'package:dovie/constants/themes/colors.dart';
import 'package:flutter/material.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;

  final IconData icon;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.icon,
    required this.onChanged,
    // required this.text,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: ScreenSize.getHeight(25),
      height: ScreenSize.getHeight(25),
      decoration: ShapeDecoration(
        shape: const CircleBorder(
          side: BorderSide(
            color: AppColors.buttonColor,
            width: 2,
          ),
        ),
        color: isSelected ? AppColors.buttonColor : Colors.transparent,
      ),
      child: Center(
          child: isSelected
              ? Image.asset('assets/images/tick-white.png')
              : Container()),
    );
  }

  // Widget _buildText() {
  //   return Icon(
  //     icon,
  //     // style: const TextStyle(color: Colors.black, fontSize: 24),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      splashColor: Colors.cyan.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Row(
          children: [
            _buildLabel(),
            const SizedBox(width: 10),
            // _buildText(),
          ],
        ),
      ),
    );
  }
}
