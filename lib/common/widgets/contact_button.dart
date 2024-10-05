// Widget reutilizável para o botão de contato
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContactButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.buttonBlue, width: 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "CONTACT ME",
          style: AppTextStyles.buttonText.copyWith(color: AppColors.buttonBlue),
        ),
      ),
    );
  }
}