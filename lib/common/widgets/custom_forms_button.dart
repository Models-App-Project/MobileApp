import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class CustomFormsButton extends StatelessWidget {
  const CustomFormsButton(
      {super.key,
      required this.title,
      required this.backgroundColor,
      required this.titleColor});

  final String title;
  final Color backgroundColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            foregroundColor: titleColor,
            backgroundColor: backgroundColor,
            textStyle: AppTextStyles.buttonFormsText,
            side: const BorderSide(width: 1.0, color: AppColors.focusedInput),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        )
    );
  }
}
