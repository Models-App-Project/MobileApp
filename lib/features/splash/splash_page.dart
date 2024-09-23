import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.white
        ),
        child: Image.asset('assets/images/logo_fernanda.png'),
      ),
    );
  }
}