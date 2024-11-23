import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {
  static const Color lightPrimaryColor = Color(0xffB7935F);
  static const Color blackColor = Color(0xff242424);
  static const Color whiteColor = Color(0xffF8F8F8);
  static const Color darkPrimaryColor = Color(0xff141A2E);
  static const Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor, unselectedItemColor: whiteColor),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30.sp, fontWeight: FontWeight.w700, color: blackColor),
          titleMedium: TextStyle(
              fontSize: 25.sp, fontWeight: FontWeight.w600, color: blackColor),
          titleSmall: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w400, color: blackColor)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightPrimaryColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0));
  static ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 30.sp, fontWeight: FontWeight.w700, color: yellowColor),
          titleMedium: TextStyle(
              fontSize: 25.sp, fontWeight: FontWeight.w600, color: yellowColor),
          titleSmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: yellowColor)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimaryColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0));
}
