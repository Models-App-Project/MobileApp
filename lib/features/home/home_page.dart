import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Flexible(child: Image.asset('assets/images/logo_fernanda2.png')),
          Flexible(
            child: Image.asset(
              'assets/images/fernanda_photo.png',
              width: MediaQuery.of(context).size.width,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            "QUEM SOMOS NÓS?",
            textAlign: TextAlign.center,
            style: AppTextStyles.bigText,
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: const Column(
              children: [
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.regularText,
                ),
                SizedBox(height: 10),
                Text(
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.regularText,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 160,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.buttonBlue, width: 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "CONTACT ME",
                style: AppTextStyles.buttonText
                    .copyWith(color: AppColors.buttonBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
