import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';
import 'package:flutter_application_1/features/forms/forms_page.dart';

class TakePartPage extends StatelessWidget {
  const TakePartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Flexible(child: Image.asset('assets/images/logo_fernanda2.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Model1.png',
                height: 280,
              ),
              const SizedBox(
                width: 14,
              ),
              Image.asset(
                'assets/images/Model2.png',
                height: 280,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/Model3.png',
                width: 300,
                height: 145,
              ),
              Positioned(
                bottom: 3,
                right: 15,
                child: ElevatedButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => const FormsPage()
                              )
                          )
                        },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 30),
                        backgroundColor: AppColors.white,
                        side: const BorderSide(
                            color: AppColors.buttonBlue, width: 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text("JOIN WITH",
                        style: AppTextStyles.buttonText
                            .copyWith(color: AppColors.buttonBlue))),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              "Want to take part of this top models, and change the vision about you. Take part of us and apply to be a model of our bussines.",
              textAlign: TextAlign.justify,
              style: AppTextStyles.regularTextSerif,
            ),
          )
        ],
      ),
    );
  }
}
