import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle bigText = TextStyle(
      fontFamily: 'Crimson Pro',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: 3);

  static const TextStyle regularText = TextStyle(
      fontFamily: 'Crimson Pro', fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle regularTextSerif = TextStyle(
      fontFamily: 'Bree Serif', fontSize: 14, fontWeight: FontWeight.w400);

  static const TextStyle smallText = TextStyle(
      fontFamily: 'Crimson Pro', fontSize: 14, fontWeight: FontWeight.w300);

  static const TextStyle buttonText = TextStyle(
      fontFamily: 'Bree Serif', fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle formsText = TextStyle(
      fontFamily: 'Bree Serif', fontSize: 12, fontWeight: FontWeight.w800);

  static const TextStyle formshintText = TextStyle(
      fontFamily: 'Bree Serif', fontSize: 12, fontWeight: FontWeight.w400);

  static const TextStyle buttonFormsText = TextStyle(
      fontFamily: 'Josefin Sans',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.4);
}
