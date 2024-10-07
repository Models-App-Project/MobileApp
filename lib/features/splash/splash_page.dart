import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        alignment: Alignment.center,
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}