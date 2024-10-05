import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/features/forms/forms_page.dart';
import 'package:flutter_application_1/features/home/home_page.dart';
import 'package:flutter_application_1/features/splash/splash_page.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  int itemSelecionado = 0;
  List pages = const [SplashPage(), HomePage(), FormsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[itemSelecionado],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 50,
                spreadRadius: 0.1)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.selectedItemColor,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            backgroundColor: AppColors.white,
            currentIndex: itemSelecionado,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt_outlined), label: "Models"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.volunteer_activism_outlined), label: "Share")
            ],
            onTap: (valor) {
              setState(() {
                itemSelecionado = valor;
              });
            },
          ),
        ),
      ),
    );
  }
}
