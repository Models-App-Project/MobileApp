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
  int itemSelecionado = 1;
  List pages = const [SplashPage(), HomePage(), FormsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[itemSelecionado],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 15),
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
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.selectedItemColor,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.white,
            currentIndex: itemSelecionado,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.volunteer_activism_outlined), label: '')
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
