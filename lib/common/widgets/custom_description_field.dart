import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class CustomDescriptionField extends StatelessWidget {
  const CustomDescriptionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: AppTextStyles.formsText,
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 8,
          decoration: const InputDecoration(
            hintText:
                'Talk a little about you and why do you want to work here',
            hintStyle: AppColors.hintText,
            enabledBorder: OutlineInputBorder(
              // Adicione isso
              borderSide: BorderSide(color: AppColors.borderInput),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.focusedInput),
            ),
          ),
          cursorColor: AppColors.cursor,
          style: AppTextStyles.formshintText,
        ),
      ],
    );
  }
}
