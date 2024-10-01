import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/widgets/custom_description_field.dart';
import 'package:flutter_application_1/common/widgets/custom_text_field.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
                flex: 0,
                child: Image.asset('assets/images/logo_fernanda2.png')),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    CustomTextField(campo: 'Name', hint: 'Full Name'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Age', hint: 'Age'),
                    SizedBox(height: 16),
                    CustomDescriptionField(),
                    SizedBox(height: 16),
                    CustomTextField(
                        campo: 'Email', hint: 'Email (example@gmail.com)'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Height', hint: 'Height (cm)'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Eye’s Color', hint: 'Eye’s Color'),
                    SizedBox(height: 16),
                    CustomTextField(
                        campo: 'Hair’s Color', hint: 'Hair’s Color'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Waistline', hint: 'Waist (cm)'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Bust', hint: 'Bust (cm)'),
                    SizedBox(height: 16),
                    CustomTextField(campo: 'Hip', hint: 'Hip (cm)'),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
