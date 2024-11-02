import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/widgets/custom_forms_button.dart';
import 'package:flutter_application_1/common/widgets/custom_description_field.dart';
import 'package:flutter_application_1/common/widgets/custom_text_field.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // A imagem que fica fixa na parte superior
          Image.asset('assets/images/logo_fernanda2.png'),
          // O conteúdo rolável embaixo da imagem
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                SizedBox(height: 20),
                CustomTextField(campo: 'Name', hint: 'Full Name'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Age', hint: 'Age'),
                SizedBox(height: 16),
                CustomDescriptionField(),
                SizedBox(height: 16),
                CustomTextField(campo: 'Email', hint: 'Email (example@gmail.com)'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Height', hint: 'Height (cm)'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Eye’s Color', hint: 'Eye’s Color'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Hair’s Color', hint: 'Hair’s Color'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Waistline', hint: 'Waist (cm)'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Bust', hint: 'Bust (cm)'),
                SizedBox(height: 16),
                CustomTextField(campo: 'Hip', hint: 'Hip (cm)'),
                SizedBox(height: 16),
                Row(
                  children: [
                    CustomFormsButton(
                      title: 'CANCEL REQUEST',
                      backgroundColor: AppColors.white,
                      titleColor: AppColors.focusedInput,
                    ),
                    SizedBox(width: 20),
                    CustomFormsButton(
                      title: 'SEND REQUEST',
                      backgroundColor: AppColors.focusedInput,
                      titleColor: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
